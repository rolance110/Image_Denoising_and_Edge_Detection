module threshold(
	input 			clk, 
	input			reset,
    input           out_valid,
	input	      [7:0]  t_di,
	input	      w_b_flag,
	output	reg		done ,
	output	reg		t_wr ,
	output	reg		t_rd ,
	output	reg 	[13:0]	t_addr ,
	output	reg 	t_do
	);
//fsm
reg [1:0] cs;
reg [1:0] ns;
parameter INIT = 2'd0;
parameter READ_T = 2'd1;
parameter WRITE_T = 2'd2;
parameter FINISH = 2'd3;

always@(posedge clk or posedge reset) begin
	if(reset) 
		cs <= INIT;
	else 
		cs <= ns;
end

always@(*) begin
	case(cs)
		INIT:
			ns = READ_T;
		READ_T:
			ns = WRITE_T;
		WRITE_T:
			if(t_addr == 14'd16254) //complete Forward final pixel 
				ns = FINISH;
			else 
				ns = READ_T;
		FINISH:
			ns = INIT;
		default: 
			ns = INIT;
	endcase
end
//?wire clr = reset || done;
//t_rd
always@(posedge clk or posedge reset)begin
	if(reset) 
		t_rd <= 1'b0;
	else if(done)
		t_rd <= 1'b0;
	else if(ns == READ_T && out_valid==1'b1)
		t_rd <= 1'b1;
	else 
		t_rd <= 1'b0;
end
//t_wr
always@(posedge clk or posedge reset)begin
	if(reset) 
		t_wr <= 1'd0;
	else if(done)
		t_wr <= 1'd0;
	else if(ns == WRITE_T && out_valid==1'b1) 
		t_wr <= 1'd1;
	else 
		t_wr <= 1'd0;
end

//t_addr
always@(posedge clk or posedge reset)begin
	if(reset) 
		t_addr <= 14'd129;
	else if(done)
		t_addr <= 14'd129;
	else if(cs == WRITE_T)//?wrong  || cs == WRITE_t 
		t_addr <= t_addr + 14'd1;
end
//t_do
always@(posedge clk or posedge reset)begin
	if(reset) 
		t_do <= 1'b1;
	else if(done)
		t_do <= 1'b1;
	else if(ns == WRITE_T && t_di > 8'd1 && w_b_flag)//?threshold 
		t_do <= 1'b0;
    else if(ns == WRITE_T  && w_b_flag)//?threshold
        t_do <= 1'b1;
	else if(ns == WRITE_T && t_di > 8'd2)//?threshold 
		t_do <= 1'b0;
    else if(ns == WRITE_T )//?threshold
        t_do <= 1'b1;

end
//done
always@(posedge clk or posedge reset)begin
	if(reset) 
		done <= 1'b0;
	else if(cs == FINISH && out_valid==1'b1) 
		done <= 1'b1;
end

endmodule
