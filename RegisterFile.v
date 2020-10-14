`timescale 1ns / 1ps
//Asignar el valor de la instruccion 
module RegisterFile (
	input clk,
	input [9:5] rn,
	input [4:0] rm,
	input [4:0] rd,
	input [63:0] datawr,
	input regwr,
	output [63:0] o_rn,
	output [63:0] o_rm
	);
	
	(* RAM_STYLE = "BLOCK" *)
	reg [63:0] RF [31:0];
	initial 
		$readmemb("memory/register.dat", RF);
		assign  o_rn = RF[rn];
		assign  o_rm = RF[rm];
		
		always @(posedge clk)
				if (regwr) RF[rd] <= datawr;

endmodule  