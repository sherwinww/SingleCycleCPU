`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:32 04/17/2019
// Design Name:   top
// Module Name:   D:/workspace/ISE/mips/top_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clkin;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clkin(clkin), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clkin = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#400;
        
		// Add stimulus here
		reset = 0;
	end
	
	parameter PERIOD=200; 
	always begin 
		clkin = 1'b0; 
		#(PERIOD/2) 
		clkin=1'b1; 
		#(PERIOD/2);
	end 
endmodule

