`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:55 02/12/2018 
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
module top(clk,r_a,r_b,led0, led1, led2, led3, led4, led5, led6, led7
    );
input clk,r_a,r_b;
output wire led0, led1, led2, led3, led4, led5, led6, led7;
wire r_e,r_d;
check a1(clk,r_a,r_b,r_d,r_e);
main a2(clk,r_d,r_e,led0, led1, led2, led3, led4, led5, led6, led7);
endmodule
