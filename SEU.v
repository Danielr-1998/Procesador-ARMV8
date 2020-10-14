`timescale 1ns / 1ps
//Recibe los vlores inmediatos
//Define 4 tipos de instrucciones
module SEU( 
	input [25:0] inst,
	input [1:0] seu,
	output reg [63:0] out_seu
	);
	
	always @(*)
		begin
			case (seu)
				2'b00: out_seu = {52'b0, inst[21:10]};
				2'b01: out_seu = {{55{inst[20]}}, inst[20:12]};
				2'b10: out_seu = {{36{inst[25]}}, inst[25:0],2'b0};
				2'b11: out_seu = {{43{inst[23]}}, inst[23:5],2'b0}; 
			endcase
		end
endmodule 