`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:47 02/12/2018 
// Design Name: 
// Module Name:    main 
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
module main(clk,r_e,r_d,led0, led1, led2, led3, led4, led5, led6, led7
    );
input clk;
input r_e;
input r_d;
output reg led0, led1, led2, led3, led4, led5, led6, led7;
reg prev;
initial begin
prev=1;
led0=1;
led1=0;
led2=0;led3=0;led4=0;led5=0;led6=0;led7=0;
end
always @(posedge clk) begin
prev<=r_e;
if(prev==0 && r_e==1) begin
if(r_d==0) begin
led0<=led1;
         led1<=led2;
         led2<=led3;
         led3<=led4;
         led4<=led5;
         led5<=led6;
         led6<=led7;
         led7<=led0;
end
if(r_d==1) begin
led1<=led0;
         led2<=led1;
         led3<=led2;
         led4<=led3;
         led5<=led4;
         led6<=led5;
         led7<=led6;
         led0<=led7;
end
end
end
endmodule
