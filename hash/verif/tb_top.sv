`timescale 1ns / 1ps
module tb_top;
//clock and reset signal declaration
`include "sample_input.vh"
logic tb_clk, reset;
logic [31:0] tb_WB_Data;
logic [511:0] in;
logic [255:0] out;

integer count;

//DATA

	//clock generation
	always #10 tb_clk = ~tb_clk;
	always #60 count++;

  //reset Generation
  initial 
  begin
	  //Creating a seed 
	  $display("Created our variable in from randomly generated file");
	  $display("our input is %h", `sampleInput);
	  // randomize 512 bits
	  count = 0;
	  tb_clk = 0;
	  reset = 1;
	  #25 reset =0;
	  in = `sampleInput;
  end

  SHA256 sha256(in, out);
  initial begin
	  #20000;
	  $finish;
  end

endmodule
