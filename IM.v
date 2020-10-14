`timescale 1ns / 1ps
//Lectura de archivo y las carga en la Ram
//Recibe 64 bits entrega 
module IM (
	input [10:2] pc,
	output reg [31:0] inst 
	);
		(* RAM_STYLE = "BLOCK" *)
		reg [31:0] Ins_Mem [511:0];
		initial
			$readmemb("memory/inmem2.txt", Ins_Mem);
		always @(pc)
			inst <= Ins_Mem[pc];
	
endmodule 