`timescale 1ns / 1ps

module Mux1_TB;

	// Inputs
	reg [4:0] crm;
	reg [4:0] crt;
	reg creg2loc;

	// Outputs
	wire [4:0] cout_mux1;

	// Instantiate the Unit Under Test (UUT)
	Mux1 uut (
		.rm(crm), 
		.rt(crt), 
		.reg2loc(creg2loc), 
		.out_mux1(cout_mux1)
	);

	initial begin
	
		$monitor("Value of rm=%b, rt=%b, reg2loc=%b, out_mux1=%b", crm, crt, creg2loc,cout_mux1);
	
		// Initialize Inputs
		crm = 0;
		crt = 0;
		creg2loc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		crm = 5'b00101;
		crt = 5'b00110;
		creg2loc = 1;
		
		#100;
		crm = 5'b00101;
		crt = 5'b00110;
		creg2loc = 0;;
		

	end
      
endmodule

