`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:35 04/02/2018 
// Design Name: 
// Module Name:    encoder 
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
module encoder(pb, clk, led
    );
         input clk, pb;

         output [7:0] led;
			         reg [7:0] led;
         wire [7:0] fsum;
			reg [7:0] sum;

         wire parity;
         reg[15:0] register_file[0:7];
         reg [7:0] encode;
         
         reg s;
         reg [3:0] counter;
         
         initial begin
                counter = 4'b0000;
                register_file[0] = 16'b0000_0000_0000_0000;
                register_file[1] = 16'b1000_1000_0000_0000;
                register_file[2] = 16'b0000_0001_0000_0000;
                register_file[3] = 16'b1000_0000_0000_0000;
                register_file[4] = 16'b0000_0000_0000_0001;
                register_file[5] = 16'b0000_1000_0000_0000;
                register_file[6] = 16'b1000_0001_0001_0000;
                register_file[7] = 16'b0000_0000_1000_0000;
                encode = 0;
                sum = 0;
                led = 0;
                s = 0;
         end
         
         always@(posedge clk) begin
            
            if(counter < 8) begin
		
              case(register_file[counter])

                16'b0000_0000_0000_0001: begin
                  encode <= 8'b0000_0000;
                end

                16'b0000_0000_0000_0010: begin
                  encode <= 8'b0000_0001;
                end

                16'b0000_0000_0000_0100: begin
                  encode <= 8'b0000_0010;
                end

                16'b0000_0000_0000_1000: begin
                  encode <= 8'b0000_0011;
                end

                16'b0000_0000_0001_0000: begin
                  encode <= 8'b0000_0100;
                end

                16'b0000_0000_0010_0000: begin
                  encode <= 8'b0000_0101;
                end
                16'b0000_0000_0100_0000: begin
                  encode <= 8'b0000_0110;
                end
                16'b0000_0000_1000_0000: begin
                  encode <= 8'b0000_0111;
                end
                16'b0000_0001_0000_0000: begin
                  encode <= 8'b0000_1000;
                end
                16'b0000_0010_0000_0000: begin
                  encode <= 8'b0000_1001;
                end

                 16'b0000_0100_0000_0000: begin
                  encode <= 8'b0000_1010;
                end
                16'b0000_1000_0000_0000: begin
                  encode <= 8'b0000_1011;
                end
                16'b0001_0000_0000_0000: begin
                  encode <= 8'b0000_1100;
                end
                16'b0010_0000_0000_0000: begin
                  encode <= 8'b0000_1101;
                end
                16'b0100_0000_0000_0000: begin
                  encode <= 8'b0000_1110;
                end
                16'b1000_0000_0000_0000: begin
                  encode <= 8'b0000_1111;
                end

                default: begin
                  encode <= 8'b1111_1111;
                end

             endcase
              
              counter <= counter + 1;
            end

            else if(counter < 10) begin
              encode <= 0;
	      counter <= counter + 1;
            end
	    
	    else begin
	      encode <= 0;
	    end
         end

         assign parity = sum[0]^sum[1]^sum[2]^sum[3]^sum[4]^sum[5]^sum[6]^sum[7];

         eight_bit_adder EA (encode, sum, fsum);

	 always@(posedge clk) begin
	    if (counter < 9) begin
			sum <= fsum;
	    end
	 end

         always@(posedge clk) begin
            if (s == 0) begin
              led <= sum;
            end
				if(s == 1) begin
					led[7:1] <= 0;
					led[0] <= parity;
				end
         end
			
			always@(posedge pb) begin
				s <= 1;
			end

endmodule
