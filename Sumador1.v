`timescale 1ns / 1ps

module Sumador1(
	input [63:0] curr_pc,
	output reg [63:0] next_pc
	);

	always @(*)
		next_pc = curr_pc + 3'b100;

endmodule
