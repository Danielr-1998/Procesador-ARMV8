`timescale 1ns / 1ps
//Toma desicion de mem reg
module Mux4(
    input [63:0] out_dm,
    input [63:0] out_alu,
	 input memtoreg,
    output reg [63:0] out_mux4
    );
	
	always@*
		out_mux4 = memtoreg ? out_dm : out_alu;

endmodule
