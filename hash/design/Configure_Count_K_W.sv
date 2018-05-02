`include "Constants.vh"
module Configure_Count_K_W #(parameter IN_W = 512)
(
	input logic[IN_W - 1:0] in,
	input integer count,
	ref logic [31:0] W_Mem [16],
	output logic [31:0]W,
	output logic [31:0]K
);
logic [31:0] s0; //w[i-15] rightrotate 7 ^ w[i-15] rightrotate 18 ^ w[i-3] rightshift 3
logic [31:0] temp_s0; //w[i-15] rightrotate 7 ^ w[i-15] rightrotate 18 ^ w[i-3] rightshift 3
logic [31:0] s0_rr7;
logic [31:0] s0_rr18;
logic [31:0] s0_rs3;
logic [31:0] s1; //w[i-2] rightrotate 17 ^ w[i-2] rightrotate 19 ^ w[i-2] rightshift 10
logic [31:0] temp_s1; //w[i-2] rightrotate 17 ^ w[i-2] rightrotate 19 ^ w[i-2] rightshift 10
logic [31:0] s1_rr17;
logic [31:0] s1_rr19;
logic [31:0] s1_rs10;


	assign temp_s0 = (count > 15) ? W_Mem[(count-15)%16] : 0;

	assign s0_rr7 = {temp_s0[6:0], temp_s0[31:7]};
	assign s0_rr18 = {temp_s0[17:0], temp_s0[31:18]};
	assign s0_rs3 = temp_s0 >> 3;
	assign s0 = (count > 15) ? s0_rr7 ^ s0_rr18 ^ s0_rs3 : 0;

	assign temp_s1 = (count > 15) ? W_Mem[(count-2)%16] : 0; 

	assign s1_rr17 = {temp_s1[16:0], temp_s1[31:17]};
	assign s1_rr19 = {temp_s1[18:0], temp_s1[31:19]};
	assign s1_rs10 = temp_s1 >> 10;
	assign s1 = (count > 15) ? s1_rr17 ^ s1_rr19 ^ s1_rs10: 0;


	assign W = (count < 16)? in[count*32 +: 32] : W_Mem[(count-16)%16] + W_Mem[(count-7)%16] + s0 + s1; 
	/* 
	* One problem that needs to be solved is that temp_s0 and temp_s1 are limited:
	* They the values of W_i-15 and W_i-2 must be stored elsewhere, then brought back here.
	* One solution would be to store the last seven entries into an array treat it like a queue
	*/


	assign K = k[count];
	/*
	initial begin
		temp_s0 = (count > 15) ? W_Mem[(count-15)%16] : 0;
		temp_s1 = (count > 15) ? W_Mem[(count-2)%16] : 0; 
	end*/

	always_comb begin
		$display("Count is at %d \n", count);
	//	W_Mem[count%16] = W;
	end
	//if count >16 W = w[i-16]+ s0 + w[i-7] + s1

	endmodule
