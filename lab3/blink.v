`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:02 02/05/2018 
// Design Name: 
// Module Name:    blink 
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
`define OFF_TIME 25000000
`define ON_TIME  50000000
module blink(clk,led
    );
input clk;
output led;
reg led;
reg [26:0] counter;
initial counter=0;
initial led=0;
always @(posedge clk) begin
        if(counter== `OFF_TIME) begin
        led<=1;
        end
        if(counter==`ON_TIME) begin
        led<=0;
        counter<=0;
        end
        counter<=counter+1;
end
endmodule
