`timescale 1ns / 1ps

module Mux3(
	input [63:0] src1, //->RF
	input [63:0] src2, //->SEU
	input [4:0] src3,  //->LSL
	input [1:0] alusrc,
	output reg [63:0]src
	);
	
	/*always @*
		src = alusrc ? src2 : src1;
		*/
	always @(src1,src2,alusrc)
	case (alusrc)
		2'b00: src <= src1;
		2'b01: src <= src2;
		2'b10: src <= {59'b0,src3};
		default: src <= 00;
	endcase
	
endmodule 