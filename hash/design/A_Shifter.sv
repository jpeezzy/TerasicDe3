`timescale 1ns / 1ps
module A_Shifter #(parameter BIT_W = 32)
(
	input logic[BIT_W - 1:0] A,
	output logic[BIT_W -1:0] out
);

logic [BIT_W - 1:0] Ashift2;
logic [BIT_W - 1:0] Ashift13;
logic [BIT_W - 1:0] Ashift22;

assign Ashift2 = {A[1:0], A[BIT_W-1:2]};
assign Ashift13 = {A[12:0], A[BIT_W-1:13]};
assign Ashift22 = {A[21:0], A[BIT_W-1:22]};

assign out = Ashift2 ^ Ashift13 ^ Ashift22;

endmodule
