`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:48 04/02/2018 
// Design Name: 
// Module Name:    eight_bit_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module eight_bit_adder(a, b, c);

	input [7:0] a;
	input [7:0] b;

	output [7:0] c;
		wire [7:0] c;

	wire [7:0] carry;

	full_adder FA0 (a[0], b[0], 1'b0, c[0], carry[0]);
	full_adder FA1 (a[1], b[1], carry[0], c[1], carry[1]);
	full_adder FA2 (a[2], b[2], carry[1], c[2], carry[2]);
	full_adder FA3 (a[3], b[3], carry[2], c[3], carry[3]);
	full_adder FA4 (a[4], b[4], carry[3], c[4], carry[4]);
	full_adder FA5 (a[5], b[5], carry[4], c[5], carry[5]);
	full_adder FA6 (a[6], b[6], carry[5], c[6], carry[6]);
	full_adder FA7 (a[7], b[7], carry[6], c[7], carry[7]);

endmodule
