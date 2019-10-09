`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:18 02/12/2018 
// Design Name: 
// Module Name:    read 
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
module read(clk,r_d,r_e,a,sum
    );
input clk,r_d,r_e;
input [3:0] a;
output wire [7:0]sum;
reg [6:0] c;
reg [6:0] d;
wire [6:0] carry;
reg[3:0] counter;
reg op;
reg prev;
initial begin
prev=1;
counter=0;
end
always @(posedge clk) begin
prev<=r_e;
if(prev==0 && r_e==1) begin
if(counter==0) begin
c[3:0]<=a;
counter<=counter+1;
end
if(counter==1) begin
c[6:4]<=a[2:0];
counter<=counter+1;
end
if(counter==2) begin
d[3:0]<=a;
counter<=counter+1;
end
if(counter==3) begin
d[6:4]<=a[2:0];
counter<=counter+1;
end
if(counter==4) begin
op<=a[0];
counter<=0;
end
end
end
one fa1(c[0],d[0],op,op,sum[0],carry[0]);
one fa2(c[1],d[1],op,carry[0],sum[1],carry[1]);
one fa3(c[2],d[2],op,carry[1],sum[2],carry[2]);
one fa4(c[3],d[3],op,carry[2],sum[3],carry[3]);
one fa5(c[4],d[4],op,carry[3],sum[4],carry[4]);
one fa6(c[5],d[5],op,carry[4],sum[5],carry[5]);
one fa7(c[6],d[6],op,carry[5],sum[6],carry[6]);
assign sum[7]=carry[5]^carry[6];
endmodule
