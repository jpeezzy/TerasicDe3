module Set_W_Mem #(parameter BIT_W = 32,
					parameter MEM_W = 16)
(
	input logic [31:0] W, //Out input for a particular round
	input integer count, 
	output logic [31:0] W_Memory[MEM_W] //memory that stores the first 16 bits.
	//output logic [31:0] W_Memory_out [16]//memory that stores the first 16 bits.
);

always_comb begin 
	W_Memory[count%MEM_W] = W;
end
/*
assign W_Memory_out[0] = W_Memory[1];
assign W_Memory_out[1] = W_Memory[2];
assign W_Memory_out[2] = W_Memory[3];
assign W_Memory_out[3] = W_Memory[4];
assign W_Memory_out[4] = W_Memory[5];
assign W_Memory_out[5] = W_Memory[6];
assign W_Memory_out[6] = W_Memory[7];
assign W_Memory_out[7] = W_Memory[8];
assign W_Memory_out[8] = W_Memory[9];
assign W_Memory_out[9] = W_Memory[10];
assign W_Memory_out[10] = W_Memory[11];
assign W_Memory_out[11] = W_Memory[12];
assign W_Memory_out[12] = W_Memory[13];
assign W_Memory_out[13] = W_Memory[14];
assign W_Memory_out[14] = W_Memory[15];
assign W_Memory_out[15] = W;
*/

endmodule
