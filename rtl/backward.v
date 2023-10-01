module backward(
	input 			clk, 
	input			reset,
	input 		 out_valid,
	input		[7:0] b_di,
	output	reg		b_done ,
	output	reg		b_wr ,
	output	reg		b_rd ,
	output	reg 	[13:0]	b_addr ,
	output	reg 	[7:0]	b_do
	
	);
reg [7:0] min;
reg [3:0] counter;
wire [7:0] compute_temp;
assign compute_temp = b_di + 1;

//fsm
reg [2:0] cs;
reg [2:0] ns;
parameter INIT = 3'd0;
parameter READ_B = 3'd1;
parameter WRITE_B = 3'd2;
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
			ns = READ_B;
		COUNT_5:
			if(counter== 4'd5)
				ns = WRITE_B;
			else 
				ns = COUNT_5;
		READ_B:
			if(b_di) 
				ns = COUNT_5;
			else begin
				if(b_addr == 14'd128) 
					ns = FINISH;
				else 
					ns = READ_B;
			end
		WRITE_B:
			if(b_addr == 14'd128)
				ns = FINISH;
			else 
				ns = READ_B;
		FINISH:
			ns = INIT;
		default: 
			ns = INIT;
	endcase
end
//?wire clr = reset || b_done;
//min
always@(posedge clk or posedge reset)begin
	if(reset)
		min <= 0;
	else if(b_done) 
		min <= 0;
	else if(cs == READ_B) 
		min <= b_di;
	else if(cs == COUNT_5 && min>compute_temp )
		min <= compute_temp;
end
//counter
always@(posedge clk or posedge reset)begin
	if(reset)
		counter <= 4'd15;
	else if(b_done)
		counter <= 4'd15;
	else if(ns == WRITE_B || ns == READ_B)
		counter <= 4'd0;
	else if(ns == COUNT_5)
		counter <= counter + 4'd1;
end

//b_rd
always@(posedge clk or posedge reset)begin
	if(reset)
		b_rd <= 1'b0;
	else if(b_done) 
		b_rd <= 1'b0;
	else if((ns == READ_B || ns == COUNT_5) && out_valid==1'b1)
		b_rd <= 1'b1;
	else 
		b_rd <= 1'b0;
end
//b_wr
always@(posedge clk or posedge reset)begin
	if(reset)
		b_wr <= 1'd0;
	else if(b_done) 
		b_wr <= 1'd0;
	else if(ns == WRITE_B && out_valid==1'b1) 
		b_wr <= 1'd1;
	else 
		b_wr <= 1'd0;
end

//b_addr
always@(posedge clk or posedge reset)begin
	if(reset)
		b_addr <= 14'd16255;
	else if(b_done)
		b_addr <= 14'd16255;
	else if(ns == COUNT_5 || cs == COUNT_5) begin
		case(counter)  
			4'd0: b_addr <= b_addr + 14'd129;
			4'd1: b_addr <= b_addr - 14'd1;
			4'd2: b_addr <= b_addr - 14'd1;
			4'd3: b_addr <= b_addr - 14'd126;
			4'd4: b_addr <= b_addr - 14'd1;
		endcase
	end
	else if(cs == READ_B || cs == WRITE_B) 
		b_addr <= b_addr - 14'd1;
end
//b_do
always@(posedge clk or posedge reset)begin
	if(reset)
		b_do <= 0;
	else if(b_done) 
		b_do <= 0;
	else if(ns == WRITE_B) 
		b_do <= min;
end
//done
always@(posedge clk or posedge reset)begin
	if(reset) 
		b_done <= 1'b0;
	else if(cs == FINISH && out_valid==1'b1) 
		b_done <= 1'b1;
end

endmodule
