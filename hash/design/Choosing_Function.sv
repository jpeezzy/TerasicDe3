`timescale 1ns / 1ps
module Choosing_Function #(parameter BIT_W = 32)
(
	input logic[BIT_W - 1:0] E,
	input logic[BIT_W - 1:0] F,
	input logic[BIT_W - 1:0] G,

	output logic[BIT_W - 1:0] choose_Out
);
//from boolean logic out = (!E)&G + E&F 
assign choose_Out = (~E)&F + E&F;

endmodule
