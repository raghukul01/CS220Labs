`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:17 02/05/2018 
// Design Name: 
// Module Name:    six_add 
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
module sixbit_fourbit_adder(
        a,b,op
        );
        input [5:0] a;
        input [3:0] b;
        output wire [6:0] op;
        wire [4:0] carry;

        full_adder FA0(a[0],b[0],1'b0,op[0],carry[0]);
        full_adder FA1(a[1],b[1],carry[0],op[1],carry[1]);
        full_adder FA2(a[2],b[2],carry[1],op[2],carry[2]);
        full_adder FA3(a[3],b[3],carry[2],op[3],carry[3]);
        full_adder FA4(a[4],1'b0,carry[3],op[4],carry[4]);
        full_adder FA5(a[5],1'b0,carry[4],op[5],op[6]);
endmodule
