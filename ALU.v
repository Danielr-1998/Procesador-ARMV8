`timescale 1ns / 1ps

module ALU(
    input [63:0] op_A,
    input [63:0] op_B,
	 input [2:0] aluop,
    output zero,
    output reg [63:0] ALU_Result
    );
	
	 assign zero = {ALU_Result == 0};
	 always @(*)
    begin
        case(aluop)
			  3'b000: // Addition
				  ALU_Result = op_A + op_B ; 
			  3'b001: // Subtraction
				  ALU_Result = op_A - op_B ;
			  3'b010: // And
				  ALU_Result = op_A & op_B;
			  3'b011: // Or
				  ALU_Result = op_A | op_B;
			  3'b100: // Pass B
				  ALU_Result = op_B;
			  3'b101: // Logical shift left
				  ALU_Result = op_A<<op_B;
			  3'b110: // Logical shift right
				  ALU_Result = op_A>>op_B;
			  default: ALU_Result = op_A + op_B ; 
		 endcase
	 end
		
endmodule
