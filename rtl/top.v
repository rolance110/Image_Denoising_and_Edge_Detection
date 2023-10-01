`include "../rtl/forward.v"
`include "../rtl/backward.v"
`include "../rtl/threshold.v"
`include "../rtl/convolution.v"
`include "../rtl/controller.v"

module top(
	input 			clk, 
	input			reset,
	input  	[7:0] forward_di,
	input 	[7:0] backward_di,
    input  	[7:0] threshold_di,
    input  	[7:0] convolution_di,
    output  wire [13:0]  forward_addr,
    output  wire [13:0]  backward_addr,
    output  wire [13:0]  threshold_addr,
    output  wire [13:0]  convolution_addr,
	output	wire		forward_wr,
	output	wire		forward_rd,
	output	wire		backward_wr,
	output	wire		backward_rd,
    output	wire		threshold_wr,
    output    wire		threshold_rd,
    output	wire		convolution_wr,
    output    wire		convolution_rd,
	output	wire 	[7:0]	forward_do,
	output	wire 	[7:0]	backward_do,
    output	wire 	threshold_do,
    output	wire 	[7:0]	convolution_do,
    output wire [2:0] f_RAM_sel,
    output wire [2:0] b_RAM_sel,
    output wire [2:0] t_RAM_sel,
	output wire [2:0] c_RAM_sel,
    output	wire		done
	);

wire all_rst;
wire w_b_flag;
wire forward_done;
wire backward_done;
wire threshold_done;
wire convolution_done;
wire forward_valid;
wire backward_valid;
wire threshold_valid;
wire convolution_valid;

controller controller(
    .clk(clk),
    .reset(reset),
    .forward_done(forward_done),
    .backward_done(backward_done),
    .threshold_done(threshold_done),
    .convolution_done(convolution_done),
    .w_b_flag(w_b_flag),//?
    .forward_valid(forward_valid),
    .backward_valid(backward_valid),
    .threshold_valid(threshold_valid),
    .convolution_valid(convolution_valid),
    .f_RAM_sel(f_RAM_sel),
    .b_RAM_sel(b_RAM_sel),
    .t_RAM_sel(t_RAM_sel),
    .c_RAM_sel(c_RAM_sel),
    .change_sel(change_sel),
    .all_rst(all_rst),
    .done(done)
    );
forward forward(
    .clk(clk),
    .reset(all_rst),
    .out_valid(forward_valid),
    .f_addr(forward_addr),
    .f_wr(forward_wr),
    .f_rd(forward_rd),
    .f_do(forward_do),
    .f_di(forward_di),
    .done(forward_done)
    );
backward backward( 
    .clk(clk),
    .reset(all_rst),
    .out_valid(backward_valid),
    .b_addr(backward_addr),
    .b_wr(backward_wr),
    .b_rd(backward_rd),
    .b_do(backward_do),
    .b_di(backward_di),
    .b_done(backward_done)
    );
threshold threshold(
    .clk(clk),
    .reset(all_rst),
    .out_valid(threshold_valid),
    .t_addr(threshold_addr),
    .w_b_flag(w_b_flag),//?
    .t_wr(threshold_wr),
    .t_rd(threshold_rd),
    .t_do(threshold_do),
    .t_di(threshold_di),
    .done(threshold_done)
    );
convolution convolution(
    .clk(clk),
    .reset(all_rst),
    .out_valid(convolution_valid),
    .c_addr(convolution_addr),
    .c_wr(convolution_wr),
    .c_rd(convolution_rd),
    .c_do(convolution_do),
    .c_di(convolution_di[0]),
    .change_sel(change_sel),
    .done(convolution_done)
    );




endmodule
