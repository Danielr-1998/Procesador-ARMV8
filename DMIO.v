`timescale 1ns / 1ps

module DMIO(
    input [63:0] address,
    input [63:0] datawrite,
    input [63:0] dataread,
    input [7:0] switch,
    input [7:0] leds,
    input memwr,
    input memrd
    );

	 assign enable1 = memwr & ~address[12];
	 assign enable2 = memwr &  address[12];
	 
	 (* RAM_STYLE = "BLOCK" *)
	 reg [63:0] DataMem [127:0];
	 initial
			$readmemb("memory/datamemoryio.txt", DataMem);
			
			always @(address,  memrd, memwr)
					if (enable) 
						DataMem[address[11:0]] <= datawrite;
			assign dataread = DataMem[address[11:0]];
			
			always @(*)
					if (enable2) 
						leds <= datawrite[7:0];
			assign dataread = {56'b0, switch[7:0]} ? address[12] : dataread;
			
endmodule
