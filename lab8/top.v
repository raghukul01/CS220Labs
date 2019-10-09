`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:51 03/26/2018
// Design Name:   instruction_counter
// Module Name:   /users/btech/ayushb/lab8/top.v
// Project Name:  lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top;

	// Inputs
	reg bit;
	reg clk;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	instruction_counter uut (
		.bit(bit), 
		.clk(clk), 
		.led(led)
	);

	always@(led)
	begin
		$display("jump = %b%b, i-type = %b%b%b, r-type = %b%b%b\n", led[7], led[6], led[5], led[4], led[3], led[2], led[1], led[0]);
	end

	initial begin
		// Initialize Inputs
		bit = 0;

		forever begin
		clk=0;
		#5
		clk=1;
		#5
		clk=0;
		end
        
		// Add stimulus here

	end
      
endmodule

