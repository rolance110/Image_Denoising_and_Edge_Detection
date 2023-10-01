module controller(
	input 			clk, 
	input			reset,
	input  	forward_done,
	input  	backward_done,
	input  	threshold_done,
	input   convolution_done,
	input   change_sel,
	output reg [2:0] f_RAM_sel,
	output reg [2:0] b_RAM_sel,
	output reg [2:0] t_RAM_sel,
	output reg [2:0] c_RAM_sel,
	output	reg		forward_valid,
	output	reg		backward_valid, 	
	output	reg		threshold_valid,
	output	reg		convolution_valid,
	output reg all_rst,
	output wire w_b_flag,
	output	reg		done
	);
reg [1:0] valid_cnt; //to dicide all_rst rising 
always@(*)begin//FIXME: 
	valid_cnt = forward_valid + backward_valid + threshold_valid + convolution_valid;
end

reg [1:0] done_cnt;
always@(posedge clk or posedge reset)begin
	if(reset) 
		done_cnt <= 2'd0;
	else if(done_cnt == valid_cnt)//? number of section : 3
		done_cnt <= 2'd0;
	else
		done_cnt <= forward_done + backward_done + threshold_done + convolution_done;
end
reg [3:0] pic_cnt;
always@(posedge clk or posedge reset)begin
	if(reset) 
		pic_cnt <= 4'd0;
	else if(done_cnt == valid_cnt)
		pic_cnt <= pic_cnt + 4'd1;
end

assign w_b_flag = pic_cnt>4 ? 1'b0 : 1'b1;//?

//all section reset
always@(posedge reset or posedge clk) begin
	if (reset)begin
		all_rst <= 1'b1;
	end
	else if(done_cnt==valid_cnt)begin
		all_rst <= 1'b1;
	end
	else begin
		all_rst <= 1'b0;
	end
end


//forward RAM select
always@(posedge reset or posedge clk) begin
	if (reset)
		f_RAM_sel <= 3'b111;
	else if(!forward_valid)
		f_RAM_sel <= 3'b111;//empty memory
	else if(all_rst && f_RAM_sel == 3'd2)
		f_RAM_sel <= 3'b000;
	else if(all_rst)
		f_RAM_sel <= f_RAM_sel + 3'd1;
end
//backward RAM select
always@(posedge reset or posedge clk) begin
	if (reset)
		b_RAM_sel <= 3'b111;
	else if(all_rst && pic_cnt == 4'd1)
		b_RAM_sel <= 3'd0;//empty memory
	else if(!backward_valid)
		b_RAM_sel <= 3'b111;
	else if(all_rst == 1'b1 && b_RAM_sel == 3'd2)
		b_RAM_sel <= 3'b000;
	else if(all_rst)
		b_RAM_sel <= b_RAM_sel + 3'd1;
end
//threshold RAM select
always@(posedge reset or posedge clk) begin
	if (reset)
		t_RAM_sel <= 3'b111;
	else if(all_rst && pic_cnt == 4'd2)
		t_RAM_sel <= 3'd0;//empty memory
	else if(!threshold_valid)
		t_RAM_sel <= 3'b111;//empty memory
	else if(all_rst == 1'b1 && t_RAM_sel == 3'd2)
		t_RAM_sel <= 3'd0;
	else if(all_rst)
		t_RAM_sel <= t_RAM_sel + 3'd1;
end
//convolution RAM selectTODO: add other combinationFIXME: add other combination
always@(posedge reset or posedge clk) begin
	if (reset)
		c_RAM_sel <= 3'b111;
	else if(all_rst && pic_cnt == 4'd6)
		c_RAM_sel <= 3'd0;//empty memory
	else if(!convolution_valid)
		c_RAM_sel <= 3'b111;//empty memory
	else if(change_sel)begin
		case (c_RAM_sel)
			3'd0:c_RAM_sel <= 3'd3;
			3'd1:c_RAM_sel <= 3'd0;
			3'd2:c_RAM_sel <= 3'd1; 
			default: c_RAM_sel <= 3'd7;
		endcase
	end
	else if(all_rst)
		c_RAM_sel <= c_RAM_sel + 3'd1;
	else begin
		case (c_RAM_sel)
			3'd3:c_RAM_sel <= 3'd0;
			3'd0:c_RAM_sel <= pic_cnt == 4'd6 ? 3'd0 : 3'd1;
			3'd1:c_RAM_sel <= pic_cnt == 4'd7 ? 3'd1 : 3'd2;
			3'd2:c_RAM_sel <= 3'd2; 
			default: c_RAM_sel <= 3'd7;
		endcase
	end
	
end
//forward_valid
always@(posedge reset or posedge clk) begin
	if (reset)begin
		forward_valid <= 1'b1;//0-1
	end
	else if((pic_cnt >= 4'd0) && (pic_cnt <= 4'd5))begin//FIXME: add other combination
		forward_valid <= 1'b1;
	end
	else
		forward_valid <= 1'b0;
end
//backward_done
always@(posedge reset or posedge clk) begin
	if (reset)begin
		backward_valid <= 1'b0;
	end
	else if((pic_cnt >= 4'd1) && (pic_cnt <= 4'd6))begin
		backward_valid <= 1'b1;
	end
	else begin
		backward_valid <= 1'b0;
	end
end
//threshold_done
always@(posedge reset or posedge clk) begin
	if (reset)begin
		threshold_valid <= 1'b0;
	end
	else if((pic_cnt >= 4'd2) && (pic_cnt <= 4'd7))begin
		threshold_valid <= 1'b1;
	end
	else begin
		threshold_valid <= 1'b0;
	end
end
//convolution_done
always@(posedge reset or posedge clk) begin
	if (reset)begin
		convolution_valid <= 1'b0;
	end
	else if((pic_cnt >= 4'd6) && (pic_cnt <= 4'd8))begin
		convolution_valid <= 1'b1;
	end
	else begin
		convolution_valid <= 1'b0;
	end
end
//done
always@(posedge clk or posedge reset)begin
	if(reset) 
		done <= 1'b0;
	else if(pic_cnt == 4'd9) //? picture number : 1
		done <= 1'b1;
end

endmodule
