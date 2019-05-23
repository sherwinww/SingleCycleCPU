`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:07 04/17/2019
// Design Name:   regFile
// Module Name:   D:/workspace/ISE/mips/reg_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_test;

	// Inputs
	reg clk;
	reg reset;
	reg regwr;
	reg [4:0] RsAddr;
	reg [4:0] RtAddr;
	reg [4:0] WriteAddr;
	reg [31:0] WriteData;

	// Outputs
	wire [31:0] RsData;
	wire [31:0] RtData;

	// Instantiate the Unit Under Test (UUT)
	regFile uut (
		.clk(clk), 
		.reset(reset), 
		.regwr(regwr), 
		.RsAddr(RsAddr), 
		.RtAddr(RtAddr), 
		.WriteAddr(WriteAddr), 
		.WriteData(WriteData), 
		.RsData(RsData), 
		.RtData(RtData)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		regwr = 0;
		RsAddr = 0;
		RtAddr = 0;
		WriteAddr = 0;
		WriteData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		WriteData = 32'h23332333;
		regwr = 1;
		#100;
		reset = 1;
		#200; 
		reset = 0;
	end
	
	integer i;
	parameter PERIOD=20; 
	
	always begin 
	clk = 1'b0; 
	#(PERIOD/2) 
	clk = 1'b1; 
	#(PERIOD/2);
	end
	
	always begin 
	for(i=31;i>=1;i=i-1)
		begin 
			WriteAddr = i; 
			RsAddr = i; 
			#PERIOD; 
		end
	end
endmodule

