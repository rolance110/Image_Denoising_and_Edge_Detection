module forward(
	input 			clk, 
	input			reset,
    input           out_valid,
	input	  [7:0] f_di,//?
	output	reg		done ,
	output	reg		f_wr ,
	output	reg		f_rd ,
	output	reg 	[13:0]	f_addr ,
	output	reg 	[7:0]	f_do
	);
reg [7:0] min;
reg [3:0] counter;
//fsm
reg [2:0] cs;
reg [2:0] ns;
parameter INIT = 3'd0;
parameter READ_F = 3'd1;
parameter WRITE_F = 3'd2;
parameter COUNT_5 = 3'd3;
parameter FINISH = 3'd4;

always@(posedge clk or posedge reset) begin
	if(reset) 
		cs <= INIT;
	else 
		cs <= ns;
end

always@(*) begin
	case(cs)
		INIT:
			ns = READ_F;
		READ_F:
			if(f_di) 
				ns = COUNT_5;
			else begin
				if(f_addr == 14'd16254)//complete Forward final pixel 
					ns = FINISH;
				else 
					ns = READ_F;
			end 
		COUNT_5:
			if(counter== 4'd5)
				ns = WRITE_F;
			else 
				ns = COUNT_5;
		WRITE_F:
			if(f_addr == 14'd16254) //complete Forward final pixel 
				ns = FINISH;
			else 
				ns = READ_F;
		FINISH:
			ns = INIT;
		default: 
			ns = INIT;
	endcase
end
//?wire clr = reset || done;
//min
always@(posedge clk or posedge reset)begin
	if(reset) 
		min <= 0;
	else if(done)
		min <= 0;
	else if(cs == COUNT_5) begin
		if(counter == 4'd1) 
			min <= f_di;
		else if(min > f_di) 
			min <= f_di; 
	end
end
//counter
always@(posedge clk or posedge reset)begin
	if(reset) 
		counter <= 4'd15;
	else if(done) 
		counter <= 4'd15;
	else if(ns == WRITE_F || ns == READ_F)
		counter <= 4'd0;
	else if(ns == COUNT_5)
		counter <= counter + 4'd1;
end

//f_rd
always@(posedge clk or posedge reset)begin
	if(reset) 
		f_rd <= 1'b0;
	else if(done) 
		f_rd <= 1'b0;
	else if((ns == READ_F || ns == COUNT_5) && out_valid==1'b1)
		f_rd <= 1'b1;
	else 
		f_rd <= 1'b0;
end
//f_wr
always@(posedge clk or posedge reset)begin
	if(reset) 
		f_wr <= 1'd0;
	else if(done) 
		f_wr <= 1'd0;
	else if(ns == WRITE_F && out_valid==1'b1) 
		f_wr <= 1'd1;
	else 
		f_wr <= 1'd0;
end

//f_addr
always@(posedge clk or posedge reset)begin
	if(reset) 
		f_addr <= 14'd129;
	else if(done) 
		f_addr <= 14'd129;
	else if(ns == COUNT_5 || cs == COUNT_5) begin
		case(counter)
			4'd0: f_addr <= f_addr - 14'd129;
			4'd1: f_addr <= f_addr + 14'd1;
			4'd2: f_addr <= f_addr + 14'd1;
			4'd3: f_addr <= f_addr + 14'd126;
			4'd4: f_addr <= f_addr + 14'd1;
		endcase
	end
	else if(cs == READ_F || cs == WRITE_F) 
		f_addr <= f_addr + 14'd1;
end
//f_do
always@(posedge clk or posedge reset)begin
	if(reset) 
		f_do <= 0;
	else if(done) 
		f_do <= 0;
	else if(ns == WRITE_F) 
		f_do <= min + 1;
end
//done
always@(posedge clk or posedge reset)begin
	if(reset) 
		done <= 1'b0;
	else if(cs == FINISH && out_valid==1'b1) 
		done <= 1'b1;
end

endmodule
