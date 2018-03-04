`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:16 01/15/2018
// Design Name:   two_bit_adder
// Module Name:   /users/btech/ymahajan/Desktop/CS220lab/l3/two_bit_adder/two_bit_top.v
// Project Name:  two_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_top;

        // Inputs
        reg [1:0] x;
        reg [1:0] y;

        // Outputs
        wire [1:0] z;
        wire carry;

        // Instantiate the Unit Under Test (UUT)
        two_bit_adder uut (
                .x(x), 
                .y(y), 
                .z(z), 
                .carry(carry)
        );

        always @(z[0] or z[1] or carry) begin
$display("time=%d: %b%b + %b%b = %b%b, carry= %b\n", $time, x[1],x[0], y[1],y[0],z[1],z[0],carry);   
end
initial begin
x[0] = 1;x[1]=0;y[0]=1;y[1]=0;
#5
x[0] = 1;x[1]=1;y[0]=1;y[1]=1;
#5
$finish;
end
      
endmodule
