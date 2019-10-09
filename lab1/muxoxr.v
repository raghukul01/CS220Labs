// Verilog test fixture created from schematic /users/btech/ymahajan/Desktop/CS220lab/l2/full_adder_schematic/fuller_adder_sch.sch - Mon Jan 15 15:56:53 2018

`timescale 1ns / 1ps
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:16 01/15/2018 
// Design Name: 
// Module Name:    muxor 
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
module muxor(x,y,z
    );
        input x;
        input y;
        output z;
        wire z;
        assign z=(x&~y)|(~x&y);
endmodule
