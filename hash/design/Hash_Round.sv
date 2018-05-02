`timescale 1ns / 1ps
module Hash_Round 
#(
	parameter BIT_W = 32
) //bit width of the sha 256)
(
	input integer round,
	input logic[BIT_W - 1:0] K,
	input logic[BIT_W - 1:0] W,

	input logic [BIT_W*8-1:0]in,
	output logic [BIT_W*8-1:0]out
);
//increment the counter (up to 63)

wire[BIT_W - 1:0] A;
wire[BIT_W - 1:0] B;
wire[BIT_W - 1:0] C;
wire[BIT_W - 1:0] D;
wire[BIT_W - 1:0] E;
wire[BIT_W - 1:0] F;
wire[BIT_W - 1:0] G;
wire[BIT_W - 1:0] H;
wire[BIT_W*8-1:0] _out;
assign A = in[255:224];
assign B = in[223:192];
assign C = in[191:160];
assign D = in[159:128];
assign E = in[127:96];
assign F = in[95:64];
assign G = in[63:32];
assign H = in[31:0];

always_comb begin
end

wire[BIT_W - 1:0] A_out;
wire[BIT_W - 1:0] B_out;
wire[BIT_W - 1:0] C_out;
wire[BIT_W - 1:0] D_out;
wire[BIT_W - 1:0] E_out;
wire[BIT_W - 1:0] F_out;
wire[BIT_W - 1:0] G_out;
wire[BIT_W - 1:0] H_out;


logic[BIT_W - 1:0] maj;
Majority m(A,B,C,maj);

logic[BIT_W - 1:0] aShiftOut;
A_Shifter a_s(A,aShiftOut);

logic[BIT_W - 1:0] eShiftOut;
E_Shifter e_s(E,eShiftOut);

logic[BIT_W - 1:0] chooseOut;
Choosing_Function ch(E,F,G,chooseOut);

logic[BIT_W - 1:0] hashOut;
Hash_Function r_h(W, K, H, chooseOut, eShiftOut, hashOut);

assign A_out = hashOut + aShiftOut + maj; 
assign B_out = A;
assign C_out = B;
assign D_out = C;
assign E_out = D + hashOut;
assign F_out = E;
assign G_out = F;
assign H_out = G;
assign _out = {A_out, B_out, C_out, D_out, E_out, F_out, G_out, H_out};
assign out = _out;

endmodule
