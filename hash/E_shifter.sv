module E_Shifter(parameter BIT_W = 32)
(
	input logic[BIT_W - 1:0] E,
	output logic[BIT_W -1:0] out
)

logic [BIT_W - 1:0] Eshift6;
logic [BIT_W - 1:0] Eshift11;
logic [BIT_W - 1:0] Eshift25;

assign Eshift6 = {E[5:0], E[BIT_W-1:6]};
assign Eshift13 = {E[10:0], E[BIT_W-1:11]};
assign Eshift22 = {E[24:0], E[BIT_W-1:25]};

assign out = Eshift2 ^ Eshift13 ^ Eshift22;

endmodule
