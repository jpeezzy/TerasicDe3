`timescale 1ns / 1ps
module Hash_Function #(parameter BIT_W = 32)
(
	input logic [BIT_W - 1:0] W,
	input logic [BIT_W - 1:0] K,
	input logic [BIT_W - 1:0] H,
	input logic [BIT_W - 1:0] ch, 
	input logic [BIT_W - 1:0] summation, //result from E %2
	output logic [BIT_W - 1:0]  out
);

assign out = W + K + H + ch + summation; 

endmodule
