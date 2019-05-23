`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:24:40 04/17/2019
// Design Name:   mainCtr
// Module Name:   D:/workspace/ISE/mips/mainctr_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mainCtr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mainctr_test;

	// Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDst;
	wire J;
	wire B;
	wire M2R;
	wire ALUSrc;
	wire regWr;
	wire memWr;
	wire memRe;
	wire [1:0] ALUop;

	// Instantiate the Unit Under Test (UUT)
	mainCtr uut (
		.opCode(opCode), 
		.regDst(regDst), 
		.J(J), 
		.B(B), 
		.M2R(M2R), 
		.ALUSrc(ALUSrc), 
		.regWr(regWr), 
		.memWr(memWr), 
		.memRe(memRe), 
		.ALUop(ALUop)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		opCode = 6'b000000;
		#100;
		opCode = 6'b100011;
		#100;
		opCode = 6'b101011;
		#100;
		opCode = 6'b000100;
		#100;
		opCode = 6'b000010;
		#100;
	end
      
endmodule

