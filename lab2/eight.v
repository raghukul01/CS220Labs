`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:21 01/29/2018 
// Design Name: 
// Module Name:    eight 
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
module eight(Pb1,Pb2,Pb3,Pb4,c,l2,g2,e2
    );
input Pb1;
input Pb2;
input Pb3;
input Pb4;
reg [7:0] a;
reg [7:0] b;
input [3:0] c;
wire [6:0] l1;
wire [6:0] g1;
wire [6:0] e1;
output l2;
output g2;
output e2;
wire l2;
wire g2;
wire e2;
always @(posedge Pb1) begin
a[3:0]<=c[3:0];
end
always @(posedge Pb2) begin
a[7:4]<=c[3:0];
end
always @(posedge Pb3) begin
b[3:0]<=c[3:0];
end
always @(posedge Pb4) begin
b[7:4]<=c[3:0];
end
comp1 A1 (a[7],b[7],1'b0,1'b0,1'b0,l1[6],g1[6],e1[6]);
comp1 A2 (a[6],b[6],l1[6],g1[6],e1[6],l1[5],g1[5],e1[5]);
comp1 A3 (a[5],b[5],l1[5],g1[5],e1[5],l1[4],g1[4],e1[4]);
comp1 A4 (a[4],b[4],l1[4],g1[4],e1[4],l1[3],g1[3],e1[3]);
comp1 A5 (a[3],b[3],l1[3],g1[3],e1[3],l1[2],g1[2],e1[2]);
comp1 A6 (a[2],b[2],l1[2],g1[2],e1[2],l1[1],g1[1],e1[1]);
comp1 A7 (a[1],b[1],l1[1],g1[1],e1[1],l1[0],g1[0],e1[0]);
comp1 A8 (a[0],b[0],l1[0],g1[0],e1[0],l2,g2,e2);
endmodule
