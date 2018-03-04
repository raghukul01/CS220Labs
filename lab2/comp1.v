`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:48 01/29/2018 
// Design Name: 
// Module Name:    comp1 
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
module comp1(a,b,less,great,equal,l1,g1,e1
    );
input a;
input b;
input less;
input great;
input equal;
output l1;
output g1;
output e1;
wire e1;
wire l1;
wire g1;
assign l1=(less|(~a&b))&~great;
assign g1=(great|(a&~b))&~less;
assign e1=~(~a&b|a&~b)&~less&~great&equal;
endmodule
