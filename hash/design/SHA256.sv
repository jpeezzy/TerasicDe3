`timescale 1ns / 1ps
`include "Constants.vh"
module SHA256 #(
	parameter IN_W = 512,
	parameter OUT_W=256
)
(
	input logic[IN_W - 1:0] in,
	output logic[OUT_W - 1:0] out
);

logic clock;
logic swap; //decides when to swap the output with the input items together
integer count;
logic setzero;

reg [255:0] _input;
reg [255:0] _out;
logic [31:0] _W; 
logic [31:0] _k;
wire [31:0] _W_WIRE; //used to update mem
//We want to wait until it finishes one round of the hash, so lets do that
logic [31:0] _W_Mem[16]; 

Configure_Count_K_W ckw(in, count, _W_Mem, _W, _k);
assign _W_WIRE  = _W;
//Set_W_Mem swm(_W_WIRE, count, _W_Mem);
//Counter cnt(setzero, count);

Hash_Round hr(
	count,
	_k,
	_W,
	_input,
	_out
);

always begin 
	#60 if (count < 63) begin
		count++;
		//By assigning the  _W_Mem here we avoid any race conditions
		_W_Mem[count%16] = _W_WIRE;
	end;
end

initial begin
	count = 0;
end

assign out = (count == 63) ? _out : 0;

endmodule
