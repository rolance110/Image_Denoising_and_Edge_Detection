`timescale 1ns/10ps

`include "../rtl/top.v"
`define CYCLE      3.5          	  // Modify your clock period here
`define SDFFILE    "../syn/BIP_syn.sdf"	  // Modify your sdf file name
`define End_CYCLE  200000000          // Modify cycle times once your design need more cycle times!
`define size_pic 128*128
`define INPUT_PIC "dat/input/input.bmp"//thick_error.bmp
`define INPUT_PIC1 "dat/input/input1.bmp"//thick_error.bmp
`define INPUT_PIC2 "dat/input/input2.bmp"//thick_error.bmp

`define offset2 138
`define offset 54

module testfixture;

`ifdef SDF
	initial $sdf_annotate(`SDFFILE, u_dut);
`endif

wire		 done;
wire		 forward_wr;
wire		 backward_wr;
wire         threshold_wr;
wire         convolution_wr;
wire		 forward_rd;
wire		 backward_rd;
wire         threshold_rd;
wire         convolution_rd;
wire	[13:0]	 forward_addr;
wire	[13:0]	 backward_addr;
wire	[13:0]	 threshold_addr;
wire	[13:0]	 convolution_addr;
wire	[7:0]	 forward_do;
wire	[7:0]	 backward_do;
wire	 threshold_do;
wire	 convolution_do;
reg	[7:0] forward_di;
reg	[7:0] backward_di;
reg    [7:0] threshold_di;
reg    [7:0] convolution_di; 
wire [2:0] f_RAM_sel;
wire [2:0] b_RAM_sel;
wire [2:0] t_RAM_sel;
wire [2:0] c_RAM_sel;

reg		 RAM_wr;
reg		 RAM_rd;
reg	[13:0]	 addr;
reg	[7:0]	 do;
wire	[7:0]	 di;

reg		 RAM1_wr;
reg		 RAM1_rd;
reg	[13:0]	 addr1;
reg	[7:0]	 do1;
wire	[7:0]	 di1;

reg		 RAM2_wr;
reg		 RAM2_rd;
reg	[13:0]	 addr2;
reg	[7:0]	 do2;
wire	[7:0]	 di2;

reg         RAM3_wr;
reg         RAM3_rd;
reg	[13:0]	 addr3;
reg	[7:0]	 do3;
wire	[7:0]	 di3;


reg [7:0] data [3*`size_pic+`offset:0];
reg [7:0] data1 [3*`size_pic+`offset:0];
reg [7:0] data2 [3*`size_pic+`offset:0];
reg		clk = 0;
reg		reset;

integer i;
top u_dut(
	.clk(clk),
	.reset(reset),
	.forward_di(forward_di),
	.backward_di(backward_di),
	.threshold_di(threshold_di),
	.convolution_di(convolution_di),
	.forward_addr(forward_addr),
	.backward_addr(backward_addr),
	.threshold_addr(threshold_addr),
	.convolution_addr(convolution_addr),
	.forward_wr(forward_wr),
	.backward_wr(backward_wr),
	.threshold_wr(threshold_wr),
	.convolution_wr(convolution_wr),
	.forward_rd(forward_rd),
	.backward_rd(backward_rd),
	.threshold_rd(threshold_rd),
	.convolution_rd(convolution_rd),
	.forward_do(forward_do),
	.backward_do(backward_do),
	.threshold_do(threshold_do),
	.convolution_do(convolution_do),
	.f_RAM_sel(f_RAM_sel),
	.b_RAM_sel(b_RAM_sel),
	.t_RAM_sel(t_RAM_sel),
	.c_RAM_sel(c_RAM_sel),
	.done(done)
	);

// assign RAM_rd = (forward_valid && f_RAM_sel==3'b000) ? forward_rd :((backward_valid &&b_RAM_sel==3'b000) ? backward_rd : ((threshold_valid && t_RAM_sel==3'b000) ? threshold_rd : ((c_RAM_sel==3'b000) ? convolution_rd : 0)));
// assign RAM1_rd = (forward_valid && f_RAM_sel==3'b001) ? forward_rd :((backward_valid &&b_RAM_sel==3'b001) ? backward_rd : ((threshold_valid && t_RAM_sel==3'b001) ? threshold_rd : ((c_RAM_sel==3'b001) ? convolution_rd : 0)));
// assign RAM2_rd = (forward_valid && f_RAM_sel==3'b010) ? forward_rd :((backward_valid &&b_RAM_sel==3'b010) ? backward_rd : ((threshold_valid && t_RAM_sel==3'b010) ? threshold_rd : ((c_RAM_sel==3'b010) ? convolution_rd : 0)));
// assign RAM3_rd = (forward_valid && f_RAM_sel==3'b011) ? forward_rd :((backward_valid &&b_RAM_sel==3'b011) ? backward_rd : ((threshold_valid && t_RAM_sel==3'b011) ? threshold_rd : ((c_RAM_sel==3'b011) ? convolution_rd : 0)));

reg stop,stop1,stop2,stop3;
always@(*)begin
	case(f_RAM_sel)
		3'd0: 	begin
				RAM_rd = forward_rd;
				RAM_wr = forward_wr;
				addr = forward_addr;
				do = forward_do;
				forward_di = di;
		end
		3'd1: 	begin
				RAM1_rd = forward_rd;
				RAM1_wr = forward_wr;
				addr1 = forward_addr;
				do1 = forward_do;
				forward_di = di1;
		end
		3'd2: 	begin
				RAM2_rd = forward_rd;
				RAM2_wr = forward_wr;
				addr2 = forward_addr;
				do2 = forward_do;
				forward_di = di2;
		end
		3'd3: 	begin
				RAM3_rd = forward_rd;
				RAM3_wr = forward_wr;
				addr3 = forward_addr;
				do3 = forward_do;
				forward_di = di3;
		end	
	endcase
end
always@(*)begin
	case(b_RAM_sel)
		3'd0: 	begin
				RAM_rd = backward_rd;
				RAM_wr = backward_wr;
				addr = backward_addr;
				do = backward_do;
				backward_di = di;
		end
		3'd1: 	begin
				RAM1_rd = backward_rd;
				RAM1_wr = backward_wr;
				addr1 = backward_addr;
				do1 = backward_do;
				backward_di = di1;
		end
		3'd2: 	begin
				RAM2_rd = backward_rd;
				RAM2_wr = backward_wr;
				addr2 = backward_addr;
				do2 = backward_do;
				backward_di = di2;
		end
		3'd3: 	begin
				RAM3_rd = backward_rd;
				RAM3_wr = backward_wr;
				addr3 = backward_addr;
				do3 = backward_do;
				backward_di = di3;
		end
	endcase
end
always@(*)begin
	case(t_RAM_sel)
		3'd0: 	begin 
				RAM_rd = threshold_rd;
				RAM_wr = threshold_wr;
				addr = threshold_addr;
				do = threshold_do;
				threshold_di = di; 
		end
		3'd1: 	begin
				RAM1_rd = threshold_rd;
				RAM1_wr = threshold_wr;
				addr1 = threshold_addr;
				do1 = threshold_do;
				threshold_di = di1;
		end
		3'd2: 	begin
				RAM2_rd = threshold_rd;
				RAM2_wr = threshold_wr;
				addr2 = threshold_addr;
				do2 = threshold_do;
				threshold_di = di2;
		end
		3'd3: 	begin 
				RAM3_rd = threshold_rd;
				RAM3_wr = threshold_wr;
				addr3 = threshold_addr;
				do3 = threshold_do;
				threshold_di = di3;
		end
	endcase
end
always@(*)begin
	case(c_RAM_sel)
		3'd0: 	begin
				RAM_rd = convolution_rd;
				RAM_wr = convolution_wr;
				addr = convolution_addr;
				do = convolution_do;
				convolution_di = di;
		end
		3'd1: 	begin
				RAM1_rd = convolution_rd;
				RAM1_wr = convolution_wr;
				addr1 = convolution_addr;
				do1 = convolution_do;
				convolution_di = di1;
		end
		3'd2: 	begin
				RAM2_rd = convolution_rd;
				RAM2_wr = convolution_wr;
				addr2 = convolution_addr;
				do2 = convolution_do;
				convolution_di = di2;
		end
		3'd3: 	begin
				RAM3_rd = convolution_rd;
				RAM3_wr = convolution_wr;
				addr3 = convolution_addr;
				do3 = convolution_do;
				convolution_di = di3;
		end
	endcase
end

RAM  u_RAM(.rd(RAM_rd), .wr(RAM_wr), .addr( addr), .datain( do), .dataout( di), .clk(clk));
RAM1 u_RAM1(.rd(RAM1_rd), .wr(RAM1_wr), .addr( addr1), .datain( do1), .dataout( di1), .clk(clk));
RAM2 u_RAM2(.rd(RAM2_rd), .wr(RAM2_wr), .addr( addr2), .datain( do2), .dataout( di2), .clk(clk));
RAM3 u_RAM3(.rd(RAM3_rd), .wr(RAM3_wr), .addr( addr3), .datain( do3), .dataout( di3), .clk(clk));

always begin #(`CYCLE/2) clk = ~clk; end

initial begin
	`ifdef FSDB
		$fsdbDumpfile("DT.fsdb");
		$fsdbDumpvars;
		$fsdbDumpMDA(u_RAM. M);
	`elsif VCD
		$dumpfile("DT.vcd");
		$dumpvars;
	`endif	
end

initial begin  // data input
	$display("-----------------------------------------------------\n");
 	$display("START!!! Simulation Start .....\n");
 	$display("-----------------------------------------------------\n");
   #1; reset = 1'b0; 
   @(negedge clk) #1; reset = 1'b1; 
   #(`CYCLE*3);    
   @(negedge clk) #1;  reset = 1'b0; 
end

initial begin
	#(`End_CYCLE);
	$display("-----------------------------------------------------\n");
 	$display("------The test result is .....run to end ------------\n");
 	$display("-----------------------------------------------------\n");
 	$finish;
end



integer ifile, ifile1, ifile2, ofile, ofile1, ofile2, ofile3, temp;
integer pointer, pointer1, pointer2, pointer3;

initial begin
    ifile = $fopen(`INPUT_PIC, "rb");   //read
	ifile1 = $fopen(`INPUT_PIC1, "rb"); //read
	ifile2 = $fopen(`INPUT_PIC2, "rb"); //read
    pointer = $fread(data, ifile);    //data -> input
	pointer1 = $fread(data1, ifile1); //data -> input
	pointer2 = $fread(data2, ifile2); //data -> input
    ofile = $fopen("dat/output/RAM0.bmp", "wb"); //write evaluated result
	ofile1 = $fopen("dat/output/RAM1.bmp", "wb"); //write evaluated result
	ofile2 = $fopen("dat/output/RAM2.bmp", "wb"); //write evaluated result
	ofile3 = $fopen("dat/output/RAM3.bmp", "wb"); //write evaluated result

	//store 原圖
    for(i=0;i<`size_pic;i=i+1) begin
		if(data[3*i+`offset] > 10)
        	u_RAM.M[i] = 1;
		else
			u_RAM.M[i] = 0;
    end
	$fclose(ifile);
	//store 原圖1
    for(i=0;i<`size_pic;i=i+1) begin
		if(data1[3*i+`offset] > 10)
        	u_RAM1.M[i] = 1;
		else
			u_RAM1.M[i] = 0;
    end
	$fclose(ifile1);
	//store 原圖2
	for(i=0;i<`size_pic;i=i+1) begin
		if(data2[3*i+`offset] > 10)
			u_RAM2.M[i] = 1;
		else
			u_RAM2.M[i] = 0;
	end
	
	#(`CYCLE*3);
	wait( done );

	//write bmp0
    for (i=0; i<`offset; i=i+1) begin
       $fwrite(ofile, "%c", data[i]);
    end
	for (i=0; i<`size_pic; i=i+1) begin
		temp = u_RAM. M[i];
		$fwrite(ofile, "%c", temp*50);
   		$fwrite(ofile, "%c", temp*50);
   		$fwrite(ofile, "%c", temp*50);//TODO: can fix
	end
	// for (i=0; i<`size_pic; i=i+1) begin
	// 	temp = u_RAM. M[i];
	// 	if(!temp)begin
	// 		$fwrite(ofile, "%c", 0);
	// 		$fwrite(ofile, "%c", 0);
	// 		$fwrite(ofile, "%c", 0);//TODO: can fix
	// 	end
	// 	else begin
	// 		$fwrite(ofile, "%c", 255);
	// 		$fwrite(ofile, "%c", 255);
	// 		$fwrite(ofile, "%c", 255);//TODO: can fix
	// 	end
	// end 
	//write bmp1
    for (i=0; i<`offset; i=i+1) begin
       $fwrite(ofile1, "%c", data1[i]);
    end
	for (i=0; i<`size_pic; i=i+1) begin
		temp = u_RAM1. M[i];
		$fwrite(ofile1, "%c", temp*50);
   		$fwrite(ofile1, "%c", temp*50);
   		$fwrite(ofile1, "%c", temp*50);//TODO: can fix
	end
	// for (i=0; i<`size_pic; i=i+1) begin
	// 	temp = u_RAM1. M[i];
	// 	if(!temp)begin
	// 		$fwrite(ofile1, "%c", 0);
	// 		$fwrite(ofile1, "%c", 0);
	// 		$fwrite(ofile1, "%c", 0);//TODO: can fix
	// 	end
	// 	else begin
	// 		$fwrite(ofile1, "%c", 255);
	// 		$fwrite(ofile1, "%c", 255);
	// 		$fwrite(ofile1, "%c", 255);//TODO: can fix
	// 	end
	// end 

	//write bmp2
	for (i=0; i<`offset; i=i+1) begin
	   $fwrite(ofile2, "%c", data2[i]);
	end
	for (i=0; i<`size_pic; i=i+1) begin
		temp = u_RAM2. M[i];
		if(!temp)begin
			$fwrite(ofile2, "%c", 0);
			$fwrite(ofile2, "%c", 0);
			$fwrite(ofile2, "%c", 0);//TODO: can fix
		end
		else begin
			$fwrite(ofile2, "%c", 255);
			$fwrite(ofile2, "%c", 255);
			$fwrite(ofile2, "%c", 255);//TODO: can fix
		end
	end 

	//write bmp3
    for (i=0; i<`offset; i=i+1) begin
       $fwrite(ofile3, "%c", data[i]);
    end
	for (i=0; i<`size_pic; i=i+1) begin
		temp = u_RAM3. M[i];
		$fwrite(ofile3, "%c", temp*50);
   		$fwrite(ofile3, "%c", temp*50);
   		$fwrite(ofile3, "%c", temp*50);//TODO: can fix
	end
	// for (i=0; i<`size_pic; i=i+1) begin
	// 	temp = u_RAM3. M[i];
	// 	if(!temp)begin
	// 		$fwrite(ofile3, "%c", 0);
	// 		$fwrite(ofile3, "%c", 0);
	// 		$fwrite(ofile3, "%c", 0);//TODO: can fix
	// 	end
	// 	else begin
	// 		$fwrite(ofile3, "%c", 255);
	// 		$fwrite(ofile3, "%c", 255);
	// 		$fwrite(ofile3, "%c", 255);//TODO: can fix
	// 	end
	// end 

	//w
	$fclose(ofile);
	$fclose(ofile1);
	$fclose(ofile2);
	$fclose(ofile3);
	
	$display("-----------------------------------------------------\n");
	$display("Congraduation !\n");
 	$display("------The test result is .....finish ------------------\n");
 	$display("-----------------------------------------------------\n");
 	$finish;
	#(`CYCLE/3); $finish;
end

endmodule




//-----------------------------------------------------------------------
//-----------------------------------------------------------------------
module RAM ( rd,  wr,  addr,  datain,  dataout, clk);
input		 rd,  wr;
input	[13:0] 	 addr;
input	[7:0]	 datain;
output	[7:0]	 dataout;
input		clk;

reg [7:0]  M [0:16383];

integer i;

initial for(i=0;i<=16383;i=i+1)  M[i] = 8'h0;

reg [7:0]  dataout;
always@(negedge clk)   // read data at negedge clock
	if ( rd)  dataout <=  M[ addr];

always@(posedge clk)   // write data at posedge clock
	if ( wr)  M[ addr] <=  datain;

endmodule

module RAM1 ( rd,  wr,  addr,  datain,  dataout, clk);
input		 rd,  wr;
input	[13:0] 	 addr;
input	[7:0]	 datain;
output	[7:0]	 dataout;
input		clk;

reg [7:0]  M [0:16383];

integer i;

initial for(i=0;i<=16383;i=i+1)  M[i] = 8'h0;

reg [7:0]  dataout;
always@(negedge clk)   // read data at negedge clock
	if ( rd)  dataout <=  M[ addr];

always@(posedge clk)   // write data at posedge clock
	if ( wr)  M[ addr] <=  datain;
endmodule

module RAM2 ( rd,  wr,  addr,  datain,  dataout, clk);
input		 rd,  wr;
input	[13:0] 	 addr;
input	[7:0]	 datain;
output	[7:0]	 dataout;
input		clk;

reg [7:0]  M [0:16383];

integer i;

initial for(i=0;i<=16383;i=i+1)  M[i] = 8'h0;

reg [7:0]  dataout;
always@(negedge clk)   // read data at negedge clock
	if ( rd)  dataout <=  M[ addr];

always@(posedge clk)   // write data at posedge clock
	if ( wr)  M[ addr] <=  datain;
endmodule

module RAM3 ( rd,  wr,  addr,  datain,  dataout, clk);
input		 rd,  wr;
input	[13:0] 	 addr;
input	[7:0]	 datain;
output	[7:0]	 dataout;
input		clk;

reg [7:0]  M [0:16383];

integer i;

initial for(i=0;i<=16383;i=i+1)  M[i] = 8'h0;

reg [7:0]  dataout;
always@(negedge clk)   // read data at negedge clock
	if ( rd)  dataout <=  M[ addr];

always@(posedge clk)   // write data at posedge clock
	if ( wr)  M[ addr] <=  datain;
endmodule