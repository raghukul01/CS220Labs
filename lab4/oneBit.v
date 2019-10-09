`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:12 02/12/2018 
// Design Name: 
// Module Name:    onebit 
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
module one(a,b,op,cin,sum,cout);
        input a;
        input b;
        input cin;
        input op;
        output sum;
        wire sum;
        output cout;
        wire cout;
        assign sum=a^(b^op)^cin;
        assign cout=(a&(b^op))|((b^op)&cin)|(cin&a);
endmodule
