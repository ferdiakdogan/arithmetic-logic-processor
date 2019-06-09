// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
// CREATED		"Tue Mar 19 13:52:05 2019"

module datapath(
	comp,
	clr,
	load,
	clock,
	DATA_IN,
	op,
	ERR,
	R_0,
	R_1
);


input wire	comp;
input wire	clr;
input wire	load;
input wire	clock;
input wire	[3:0] DATA_IN;
input wire	[2:0] op;
output wire	[1:0] ERR;
output wire	[3:0] R_0;
output wire	[3:0] R_1;

wire	[3:0] acc_out;
wire	[1:0] in;
wire	[3:0] out;
wire	[3:0] qout;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_38;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[0:3] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[1:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[0:3] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_39;
wire	[0:3] SYNTHESIZED_WIRE_11;
wire	[1:0] SYNTHESIZED_WIRE_13;
wire	[0:3] SYNTHESIZED_WIRE_14;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	[0:3] SYNTHESIZED_WIRE_17;
wire	[1:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[0:0] SYNTHESIZED_WIRE_21;
wire	[3:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
wire	[3:0] SYNTHESIZED_WIRE_25;
wire	[2:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[3:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	[3:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;

assign	R_0 = SYNTHESIZED_WIRE_39;
assign	R_1 = SYNTHESIZED_WIRE_5;
assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_38 = 1;
assign	SYNTHESIZED_WIRE_4 = 0;
assign	SYNTHESIZED_WIRE_8 = 0;
assign	SYNTHESIZED_WIRE_11 = 0;
assign	SYNTHESIZED_WIRE_14 = 0;
assign	SYNTHESIZED_WIRE_17 = 0;
assign	SYNTHESIZED_WIRE_23 = 0;
assign	SYNTHESIZED_WIRE_28 = 0;
assign	SYNTHESIZED_WIRE_32 = 0;
assign	SYNTHESIZED_WIRE_35 = 0;




register3	b2v_ACC(
	.clk(clock),
	.serial_in(acc_out[3]),
	.reset(SYNTHESIZED_WIRE_0),
	.parallel(SYNTHESIZED_WIRE_1),
	.right(SYNTHESIZED_WIRE_38),
	.parallel_in(SYNTHESIZED_WIRE_3),
	.out(acc_out));
	defparam	b2v_ACC.W = 4;


mux4to1	b2v_inst(
	.in_0(SYNTHESIZED_WIRE_4),
	.in_1(SYNTHESIZED_WIRE_5),
	
	
	.select(SYNTHESIZED_WIRE_6),
	.out(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst.W = 4;


mux2to1	b2v_inst11(
	.select(SYNTHESIZED_WIRE_7),
	.in_1(SYNTHESIZED_WIRE_8),
	.in_2(out),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst11.W = 4;


mux2to1	b2v_inst12(
	.select(SYNTHESIZED_WIRE_9),
	.in_1(qout),
	.in_2(SYNTHESIZED_WIRE_39),
	.out(SYNTHESIZED_WIRE_31));
	defparam	b2v_inst12.W = 4;








mux4to1	b2v_inst2(
	.in_0(SYNTHESIZED_WIRE_11),
	.in_1(SYNTHESIZED_WIRE_39),
	.in_2(acc_out),
	
	.select(SYNTHESIZED_WIRE_13),
	.out(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst2.W = 4;







mux4to1	b2v_inst25(
	.in_0(SYNTHESIZED_WIRE_14),
	.in_1(out),
	.in_2(SYNTHESIZED_WIRE_39),
	.in_3(acc_out),
	.select(SYNTHESIZED_WIRE_16),
	.out(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst25.W = 4;


mux4to1	b2v_inst26(
	.in_0(SYNTHESIZED_WIRE_17),
	.in_1(out),
	.in_2(DATA_IN),
	.in_3(qout),
	.select(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst26.W = 4;


register2	b2v_inst34(
	.clk(clock),
	.reset(SYNTHESIZED_WIRE_19),
	.enable(SYNTHESIZED_WIRE_20),
	.in(qout[0]),
	.out(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst34.W = 1;


controller	b2v_inst37(
	.clk(clock),
	.comp(comp),
	.E(SYNTHESIZED_WIRE_21),
	.clr(clr),
	.load(load),
	.op(op),
	.Q(qout),
	.T(SYNTHESIZED_WIRE_22),
	.we0(SYNTHESIZED_WIRE_33),
	.we1(SYNTHESIZED_WIRE_36),
	.AccSrc(SYNTHESIZED_WIRE_7),
	.QSrc(SYNTHESIZED_WIRE_9),
	.AccCntl(SYNTHESIZED_WIRE_1),
	.Qcntl(SYNTHESIZED_WIRE_29),
	.enable(SYNTHESIZED_WIRE_20),
	.clr_SC(SYNTHESIZED_WIRE_27),
	.reset_e(SYNTHESIZED_WIRE_19),
	.alucntl(SYNTHESIZED_WIRE_26),
	.alusrcA(SYNTHESIZED_WIRE_13),
	.alusrcB(SYNTHESIZED_WIRE_6),
	.src0(SYNTHESIZED_WIRE_18),
	.src1(SYNTHESIZED_WIRE_16));


register1	b2v_inst6(
	.clk(clock),
	.reset(SYNTHESIZED_WIRE_23),
	.in(in),
	.out(ERR));
	defparam	b2v_inst6.W = 2;


alu	b2v_inst66(
	.A(SYNTHESIZED_WIRE_24),
	.B(SYNTHESIZED_WIRE_25),
	.cntl(SYNTHESIZED_WIRE_26),
	.CO(in[0]),
	.OVF(in[1]),
	
	
	.out(out));
	defparam	b2v_inst66.W = 4;


sequence	b2v_inst8(
	.clk(clock),
	.clr(SYNTHESIZED_WIRE_27),
	.out(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst8.WIDTH = 4;


register3	b2v_Q(
	.clk(clock),
	.serial_in(acc_out[0]),
	.reset(SYNTHESIZED_WIRE_28),
	.parallel(SYNTHESIZED_WIRE_29),
	.right(SYNTHESIZED_WIRE_38),
	.parallel_in(SYNTHESIZED_WIRE_31),
	.out(qout));
	defparam	b2v_Q.W = 4;


register2	b2v_R0(
	.clk(clock),
	.reset(SYNTHESIZED_WIRE_32),
	.enable(SYNTHESIZED_WIRE_33),
	.in(SYNTHESIZED_WIRE_34),
	.out(SYNTHESIZED_WIRE_39));
	defparam	b2v_R0.W = 4;


register2	b2v_R1(
	.clk(clock),
	.reset(SYNTHESIZED_WIRE_35),
	.enable(SYNTHESIZED_WIRE_36),
	.in(SYNTHESIZED_WIRE_37),
	.out(SYNTHESIZED_WIRE_5));
	defparam	b2v_R1.W = 4;


endmodule
