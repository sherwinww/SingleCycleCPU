`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:22 04/17/2019
// Design Name:   ALUCtr
// Module Name:   D:/workspace/ISE/mips/aluctr_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUCtr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module aluctr_test;

	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] funct;

	// Outputs
	wire [3:0] ALUCtr;

	// Instantiate the Unit Under Test (UUT)
	ALUCtr uut (
		.ALUOp(ALUOp), 
		.funct(funct), 
		.ALUCtr(ALUCtr)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ALUOp = 2'b00;
		#100;
		ALUOp = 2'b01;
		#100;
		ALUOp = 2'b10;
		funct = 6'bxx0000;
		#100;
		funct = 6'bxx0010;
		#100;
		funct = 6'bxx0100;
		#100;
		funct = 6'bxx0101;
		#100;
		funct = 6'bxx1010;
	end
      
endmodule

