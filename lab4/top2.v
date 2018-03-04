`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:48 02/12/2018 
// Design Name: 
// Module Name:    top 
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
module top(clk,r_a,r_b,a,sum
    );
input clk,r_a,r_b;
input [3:0] a;
output wire [7:0] sum;
wire r_e,r_d;
check a1(clk,r_a,r_b,r_d,r_e);
read a2(clk,r_d,r_e,a,sum);
endmodule
