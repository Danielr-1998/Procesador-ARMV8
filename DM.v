`timescale 1ns / 1ps
//Data memory :Mem rd, mem wr
module DM(
    input [63:0] address,
    input [63:0] datawrite,
    input memrd,
    input memwr,
    output [63:0] dataread
    );

	 (* RAM_STYLE = "BLOCK" *)
		reg [63:0] DataMem [127:0];
		initial
			$readmemb("memory/datamemory.txt", DataMem);
			
			always @(address, datawrite, memrd, memwr)
				begin
					if (memwr) 
						DataMem[address] <= datawrite;
				end
			assign dataread = DataMem[address];
			
			
endmodule
