`timescale 1ns / 1ps
//Definicion de las señales de control y las instrucciones
module CU (
	input [10:0] inst,
	input zero,
	output reg reg2loc,
	output reg [1:0] seu,
	output reg [1:0] alusrc,
	output reg [2:0] aluop,
	output reg memrd,
	output reg memwr,
	output reg memtoreg,
	output reg regwr,
	output reg pcsrc
	);
	
	always @(inst)
		casex (inst)
			11'b10001010000  : //AND
				begin
					reg2loc  <= 0;
					seu 	   <= 2'bxx;
					alusrc   <= 2'b00;
					aluop	   <= 3'b010;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
				
			11'b10001011000  : //ADD
				begin
					reg2loc  <= 0;
					seu 	   <= 2'bxx;
					alusrc   <= 2'b00;
					aluop	   <= 3'b000;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
			
			11'b10001010000  : //ORR
				begin
					reg2loc  <= 0;
					seu 	   <= 2'bxx;
					alusrc   <= 2'b00;
					aluop	   <= 3'b011;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
					//zero
				end
				
			11'b11001011000  : //SUB
				begin
					reg2loc  <= 0;
					seu 	   <= 2'bxx;
					alusrc   <= 2'b00;
					aluop	   <= 3'b001;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
			
			11'b000101xxxxx  : //B
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b10;
					alusrc   <= 2'b01;
					aluop	   <= 3'b100;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 1'bx;
					regwr	   <= 0;
					pcsrc		<= 1; 
					//zero
				end
			
			11'b10110101xxx  : //CBNZ
				begin
					reg2loc  <= 1;
					seu 	   <= 2'b11; 
					alusrc   <= 2'b00;
					aluop	   <= 3'b100;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 1'bx; 
					regwr	   <= 0;
					if(zero == 1'b0) pcsrc <= 1;
					else pcsrc <= 0;
				end
				
			11'b10110100xxx  : //CBZ
				begin
					reg2loc  <= 1;
					seu 	   <= 2'b11;
					alusrc   <= 2'b00;
					aluop	   <= 3'b100;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 1'bx;
					regwr	   <= 0;
					if(zero == 1'b0) pcsrc <= 0;
					else pcsrc <= 1;
				end
				
			11'b11111000010  : //LDUR
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b01;
					alusrc   <= 2'b01;
					aluop	   <= 3'b000;
					memrd    <= 1;
					memwr	   <= 0;
					memtoreg <= 1;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
				
			11'b11111000000  : //STUR
				begin
					reg2loc  <= 1'b1;
					seu 	   <= 2'b01;
					alusrc   <= 2'b01;
					aluop	   <= 3'b000;
					memrd    <= 0;
					memwr	   <= 1;
					memtoreg <= 1'b1;
					regwr	   <= 0;
					pcsrc		<= 0;
				end
				
			11'b1001000100x  : //ADDI
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b00;
					alusrc   <= 2'b01;
					aluop	   <= 3'b000;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
				
			11'b1101000100x  : //SUBI
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b00;
					alusrc   <= 2'b01;
					aluop	   <= 3'b001;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
				
			11'b1001001000x  : //ANDI
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b00;
					alusrc   <= 2'b01;
					aluop	   <= 3'b010;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
				
			11'b1011001000x  : //ORRI
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'b00;
					alusrc   <= 2'b01;
					aluop	   <= 3'b011;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;
				end
			
			11'b11010011011  : //LSL
				begin
					reg2loc  <= 0;
					seu 	   <= 2'bxx;
					alusrc   <= 2'b10;
					aluop	   <= 3'b101;
					memrd    <= 0;
					memwr	   <= 0;
					memtoreg <= 0;
					regwr	   <= 1;
					pcsrc		<= 0;

				end
			
			default: 
				begin
					reg2loc  <= 1'bx;
					seu 	   <= 2'bxx;
					alusrc   <= 2'bxx;
					aluop	   <= 3'bxxx;
					memrd    <= 1'bx;
					memwr	   <= 1'bx;
					memtoreg <= 1'bx;
					regwr	   <= 1'bx;
					pcsrc		<= 1'bx;
				end
		endcase
	
endmodule 