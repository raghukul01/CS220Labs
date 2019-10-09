`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:24 02/05/2018 
// Design Name: 
// Module Name:    actual 
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
module fourbit_fivenum_adder(
         PB1,PB2,PB3,PB4,PB5,y,sum
         );
         input PB1,PB2,PB3,PB4,PB5;
         input [3:0] y;
         output wire [6:0] sum;
         wire [4:0] m,n;
         wire [5:0] p;
         reg [3:0] a,b,c,d,e;
         
         always @(posedge PB1) begin            //east a
                        a <= y;
         end
    
         always @(posedge PB2) begin            //west b
                        b <= y;
         end
         
         always @(posedge PB3) begin            //north c
                        c <= y;
         end
         
         always @(posedge PB4) begin             //south d
                        d <= y;
         end
         
         always @(posedge PB5) begin
                        e <= y;                           //center e
         end
         
         
         fourbit_adder sum1 (a,b,m);
         fourbit_adder sum2 (c,d,n);
         fivebit_adder sum3 (m,n,p);
         sixbit_fourbit_adder sum4 (p,e,sum);
endmodule
