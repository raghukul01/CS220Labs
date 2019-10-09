`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:27:23 01/15/2018
// Design Name:   Full_Adder
// Module Name:   /users/btech/ymahajan/Desktop/CS220lab/l1/Full_Adder/Full_Adder_Top.v
// Project Name:  Full_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Full_Adder_Top;

        // Inputs
        reg a;
        reg b;
        reg cin;

        // Outputs
        wire sum;
        wire cout;

        // Instantiate the Unit Under Test (UUT)
        Full_Adder uut (
                .a(a), 
                .b(b), 
                .cin(cin), 
                .sum(sum), 
                .cout(cout)
        );

        always@(sum or cout) begin
                $display("time=%d:%b+%b+%b=%b,cout=%b\n",$time,a,b,cin,sum,cout);
   end
        initial begin
                a=0;b=0;cin=0;
                #5
                a=0;b=1;cin=0;
                #5
                a=1;b=0;cin=1;
                #5
                a=1;b=1;cin=1;
                #5
                $finish;
        end
endmodule
