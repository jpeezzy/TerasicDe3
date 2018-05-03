`timescale 1ns / 1ps
module Majority #(parameter BIT_W = 32)
(
	input logic[BIT_W - 1:0] A,
	input logic[BIT_W - 1:0] B,
	input logic[BIT_W - 1:0] C,

	output logic[BIT_W - 1:0] out
);

assign out  = (A&B) | (A&C) | (B&C);

endmodule
