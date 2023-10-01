module  convolution(
  input		clk,
  input		reset,	  
  input out_valid,
  input	 c_di,//*	
  output	reg [7:0] 	c_do,//*
  output	reg  c_wr,//*
  output	reg c_rd,//*
  output reg	[13:0] c_addr,
  output reg change_sel,
  output reg	done
);
  
reg [6:0] window_x,window_y;
reg signed  op1;// 1bit

reg [3:0] conv_cnt;
reg signed [3:0] kernel1 [0:8];

reg signed [6:0] conv_out1;
wire signed [6:0] conv_out2;

always@(posedge reset or posedge clk) begin
	if(reset)begin
    	kernel1[0] = 4'b0001;
    	kernel1[1] = 4'b0001;
    	kernel1[2] = 4'b0001;
    	kernel1[3] = 4'b0001;
    	kernel1[4] = 4'b1000;//-8
    	kernel1[5] = 4'b0001;
    	kernel1[6] = 4'b0001;
    	kernel1[7] = 4'b0001;
    	kernel1[8] = 4'b0001;
	end
	else begin
		kernel1[0] = 4'b0001;
		kernel1[1] = 4'b0001;
		kernel1[2] = 4'b0001;
		kernel1[3] = 4'b0001;
		kernel1[4] = 4'b1000;//-8
		kernel1[5] = 4'b0001;
		kernel1[6] = 4'b0001;
		kernel1[7] = 4'b0001;
		kernel1[8] = 4'b0001;
	end

end

//finit state machine
reg [2:0] ns,cs;// ns:nextstate  cs:currentstate
parameter INIT =2'b00;//initial
parameter MOVE=2'b01;
parameter CONV=2'b10;
parameter FINISH=2'b11;

//set currentstate
always@(posedge clk or posedge reset)
begin
    if(reset)
        cs <= INIT ;
    else
        cs <= ns ;
end
//set nextstate from currentstate
always@(*)begin
    case(cs)
        INIT:
            ns=MOVE;             
        MOVE:
			ns =CONV;
		CONV:
			if(conv_cnt == 4'd10 && (&c_addr))//run to final
				ns=FINISH;
			else if(conv_cnt == 4'd10)
				ns=MOVE;
			else
				ns=CONV;
    	FINISH:
			ns=INIT;
    	default:
            ns=INIT;
    endcase
end
//?wire clr = reset || done;
//window x,y
always@(posedge reset or posedge clk) begin
  if (reset)begin
	window_x <= 7'd127;//TODO:64*64 bits
	window_y <= 7'd127;//TODO:64*64 bits
  end
  else if (done)begin
	window_x <= 7'd127;//TODO:64*64 bits
	window_y <= 7'd127;//TODO:64*64 bits
  end
  else if(ns == MOVE && (&window_x))begin
	window_x <= 7'd0;
	window_y <= window_y + 7'd1;
  end
  else if(ns == MOVE)begin
	window_x <= window_x + 7'd1;
	window_y <= window_y;
  end
  else begin
	window_x <= window_x;
	window_y <= window_y;
  end
end
//conv_cnt
always@(posedge reset or posedge clk) begin
  	if (reset)
		conv_cnt <= 0;
	else if (done)
		conv_cnt <= 0;
  	else if(ns == MOVE)
		conv_cnt <= 4'd15;
	else if(ns == FINISH)
		conv_cnt <= 4'd0;
  	else if(ns == CONV)
		conv_cnt <= conv_cnt + 4'd1;
end
//c_wr
always@(posedge reset or posedge clk) begin
  	if (reset)
    	c_wr <= 1'b0;
 	else if (done)
   	 	c_wr <= 1'b0;
  	else if((ns == MOVE || ns == FINISH) && out_valid)begin
    	c_wr <= 1'b1;
  	end
  	else begin
    	c_wr <= 1'b0;
  	end
end

//op1 : operator1
always@(posedge reset or posedge clk)begin
	if (reset)
		op1 <= 0;
 	else if (done)
		op1 <= 0;
	else if(ns==CONV && conv_cnt<4'd9)begin//?store 0~8
		case (conv_cnt)
			4'd0:begin
				if(window_x == 7'd0 || window_y == 7'd0)
					op1 <= 0;
				else
					op1 <= c_di;
			end 
			4'd1:begin
				if(window_y == 7'd0)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd2:begin
				if(window_x == 7'd127 || window_y == 7'd0)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd3:begin
				if(window_x == 7'd0)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd4:begin
				op1 <= c_di;
			end
			4'd5:begin
				if(window_x == 7'd127)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd6:begin
				if(window_x == 7'd0 || window_y == 7'd127)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd7:begin
				if(window_y == 7'd127)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			4'd8:begin
				if(window_x == 7'd127 || window_y == 7'd127)
					op1 <= 0;
				else
					op1 <= c_di;
			end
			default: 
				op1 <= 0;
		endcase
  end
	else
		op1 <= 0;
end
//output
always@(posedge reset or posedge clk)begin
	if (reset)
		conv_out1 <= 0;
 	else if (done)
		conv_out1 <= 0;
	else if(ns==CONV && conv_cnt != 4'd0 && conv_cnt<4'd10)//?evaluate 1~9
		conv_out1 <= conv_out1 + op1*kernel1[conv_cnt-1];
	else
		conv_out1 <= 0;
end
assign  conv_out2 = conv_out1 + 8'd0;//FIXME:bias
//c_do
always@(posedge reset or posedge clk) begin
  	if (reset)
    	c_do <= 0;
 	else if (done)
    	c_do <= 0;
  	else if(ns == MOVE || ns == FINISH)begin
		if(conv_out2[6])//!if < 0
			c_do <= 8'd0 ;
		else
			c_do <= conv_out2 ;
	end
end
//c_addr
always@(posedge reset or posedge clk) begin
  	if (reset)
    	c_addr <= 0;
 	else if (done)
    	c_addr <= 0;
	else if(ns == CONV)begin
		case(conv_cnt)
			4'd15: c_addr <= {window_y-7'd1,window_x-7'd1};
			4'd0:  c_addr <= {window_y-7'd1,window_x};
			4'd1:  c_addr <= {window_y-7'd1,window_x+7'd1};
			4'd2:  c_addr <= {window_y,window_x-7'd1};
			4'd3:  c_addr <= {window_y,window_x};
			4'd4:  c_addr <= {window_y,window_x+7'd1};
			4'd5:  c_addr <= {window_y+7'd1,window_x-7'd1};
			4'd6:  c_addr <= {window_y+7'd1,window_x};
			4'd7:  c_addr <= {window_y+7'd1,window_x+7'd1};
			default: c_addr <= c_addr;
		endcase
	end
  else if (ns == MOVE || ns == FINISH)begin
    c_addr <= {window_y,window_x};
  end
end
//c_rd
always@(posedge reset or posedge clk) begin
	if (reset)
    	c_rd <= 0;
 	else if (done)    
		c_rd <= 0;
  	else if(ns == CONV)
   		c_rd <= 1;
  	else 
    	c_rd <= 0;
end
//done
always@(posedge clk or posedge reset)begin
	if(reset) 
		done <= 1'b0;
	else if(cs == FINISH && out_valid==1'b1) 
		done <= 1'b1;
end
//change_sel
always@(posedge clk or posedge reset)begin
	if (reset)
		change_sel <= 1'b0;
 	else if (done) 
		change_sel <= 1'b0;
	else if(conv_cnt==4'd9 && out_valid==1'b1) 
		change_sel <= 1'b1;
	else
		change_sel <= 1'b0;
end
endmodule