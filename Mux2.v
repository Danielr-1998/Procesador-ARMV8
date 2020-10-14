//Mux2: salto o no de la PC
`timescale 1ns / 1ps
module Mux2(
	input [63:0] pc_sinsalto,
	input [63:0] pc_consalto,
	input pcsrc,
	output reg [63:0] nextpc
	);

	assign nextpc = pcsrc ? pc_consalto : pc_sinsalto;

endmodule 