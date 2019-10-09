`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:28 01/29/2018
// Design Name:   eightadd
// Module Name:   /users/btech/ymahajan/Desktop/Cs220lab2/l1/eightbitadder/add_top.v
// Project Name:  eightbitadder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eightadd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module add_top;

        // Inputs
        reg Pb1;
        reg Pb2;
        reg Pb3;
        reg Pb4;
        reg [3:0] c;

        // Outputs
        wire [6:0] carry;
        wire [6:0] sum;

        // Instantiate the Unit Under Test (UUT)
        eightadd uut (
                .Pb1(Pb1), 
                .Pb2(Pb2), 
                .Pb3(Pb3), 
                .Pb4(Pb4), 
                .c(c), 
                .carry(carry), 
                .sum(sum)
        );

        initial begin
                // Initialize Inputs
                Pb1 = 0;
                Pb2 = 0;
                Pb3 = 0;
                Pb4 = 0;
                c = 0;
                #100;

        end
      
endmodule

