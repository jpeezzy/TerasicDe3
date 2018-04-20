module majority(parameter BIT_W = 32)
(
	input logic[BIT_W - 1:0] A,
	input logic[BIT_W - 1:0] B,
	input logic[BIT_W - 1:0] C,

	input logic[BIT_W - 1:0] out
);

assign out  = A&B | B&C | A&C;

endmodule;
