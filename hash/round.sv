module round(parameter BIT_W = 32 //bit width of the sha 256)
(
	input integer round,
	input logic[BIT_W - 1:0] K,
	input logic[BIT_W - 1:0] W,

	input logic[BIT_W - 1:0] A,
	input logic[BIT_W - 1:0] B,
	input logic[BIT_W - 1:0] C,
	input logic[BIT_W - 1:0] D,
	input logic[BIT_W - 1:0] E,
	input logic[BIT_W - 1:0] F,
	input logic[BIT_W - 1:0] G,
	input logic[BIT_W - 1:0] H,


	input logic[BIT_W - 1:0] A_out,
	input logic[BIT_W - 1:0] B_out,
	input logic[BIT_W - 1:0] C_out,
	input logic[BIT_W - 1:0] D_out,
	input logic[BIT_W - 1:0] E_out,
	input logic[BIT_W - 1:0] F_out,
	input logic[BIT_W - 1:0] G_out,
	input logic[BIT_W - 1:0] H_out
);

logic[BIT_W - 1:0] maj;
majority m(A,B,C,maj);

logic[BIT_W - 1:0] aShiftOut;
A_Shifter a_s(A,aShiftOut);

logic[BIT_W - 1:0] eShiftOut;
E_Shifter e_s(E,eShiftOut);

endmodule
