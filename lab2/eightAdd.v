`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:10 01/29/2018 
// Design Name: 
// Module Name:    eightadd 
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
module eightadd(Pb1,Pb2,Pb3,Pb4,c,carry,sum
    );
input Pb1;
input Pb2;
input Pb3;
input Pb4;
reg [6:0] a;
reg [6:0] b;
input [3:0] c;
output [6:0] sum;
output [6:0] carry;
wire [6:0] sum;
wire [6:0] carry;
always @(posedge Pb1) begin
a[3:0]<=c[3:0];
end
always @(posedge Pb2) begin
a[6:4]<=c[2:0];
end
always @(posedge Pb3) begin
b[3:0]<=c[3:0];
end
always @(posedge Pb4) begin
b[6:4]<=c[2:0];
end
full_adder FA0 (a[0], b[0], 1'b0, sum[0], carry[0]);
full_adder FA1 (a[1], b[1], carry[0], sum[1], carry[1]);
full_adder FA2 (a[2], b[2], carry[1], sum[2], carry[2]);
full_adder FA3 (a[3], b[3], carry[2], sum[3], carry[3]);
full_adder FA4 (a[4], b[4], carry[3], sum[4], carry[4]);
full_adder FA5 (a[5], b[5], carry[4], sum[5], carry[5]);
full_adder FA6 (a[6], b[6], carry[5], sum[6], carry[6]);

endmodule
