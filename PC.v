`timescale 1ns / 1ps
//Registro contiene direccion a ejecutar
module PC(
    input [63:0] next_pc,
    output reg [63:0] curr_pc
    );
	 initial curr_pc <= 64'b0;
	/* initial 
		begin
			curr_pc = 64'b0;
		end
		*/
	 assign curr_pc = next_pc;
	 
endmodule
