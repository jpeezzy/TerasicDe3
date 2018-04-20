module Round_Hash(parameter BIT_W = 32)
(
	input [BIT_W - 1:0] W,
	input [BIT_W - 1:0] K,
	input [BIT_W - 1:0] H,
	input [BIT_W - 1:0] ch, 
	input [BIT_W - 1:0] summation, //result from E %2
	output[BIT_W - 1:0]  out
);
assign out = W + K + H + ch + summation + out; 

endmodule
