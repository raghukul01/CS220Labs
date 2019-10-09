`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:21 02/12/2018 
// Design Name: 
// Module Name:    check 
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
module check(clk,r_a,r_b,r_d,r_e
    );
         input clk;
         input r_a;
         input r_b;
         output reg r_d,r_e;
always @(posedge clk) begin
        if(r_a==1 && r_b==1) begin
        r_e<=1;
        end
        if(r_a==0 && r_b==0) begin
        r_e<=0;
        end
        if(r_a==1 && r_b==0) begin
        r_d<=0;
        end
        if(r_a==0 && r_b==1) begin
        r_d<=1;
        end
end
endmodule
