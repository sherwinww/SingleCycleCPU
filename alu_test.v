`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:47:17 04/17/2019
// Design Name:   ALU
// Module Name:   D:/workspace/ISE/mips/alu_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [3:0] ALUCtr;

	// Outputs
	wire [31:0] ALURes;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.input1(input1), 
		.input2(input2), 
		.ALUCtr(ALUCtr), 
		.ALURes(ALURes), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		ALUCtr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		input1 = 32'haaaabbbb; 
		input2 = 32'h11112222; #50;
		ALUCtr = 4'b0000; #50;  //and=00002222
		ALUCtr = 4'b0001; #50;	//or=bbbbbbbb
		ALUCtr = 4'b0010; #50;	//add=bbbbdddd
		ALUCtr = 4'b0110; #50;	//sub=99999999
		ALUCtr = 4'b0111; #50;	//slt=99999999(un)
		
		input1 = 32'haaaabbbb; 
		input2 = 32'haaaabbbb; 
		ALUCtr = 4'b0110; #50;	//0
		
		input1 = 32'h11112222; 
		input2 = 32'haaaabbbb; 	//slt=1
		ALUCtr = 4'b0111;	
		
		end
endmodule

