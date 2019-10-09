module lcd_driver(clk, line1, line2, lcd_rs, lcd_w, lcd_e, data);
    
    input clk;
    input [127:0] line1, line2;
    output lcd_rs, lcd_w, lcd_e;
    reg lcd_rs, lcd_w, lcd_e;
    output [3:0] data;
    reg [3:0] data;

    reg [31:0] counter;
    reg [1:0] state;
    reg [7:0] i;
    reg [7:0] db;

    initial begin
        counter = 0;
        state = 0;
        i = 0;
    end

    always@(posedge clk) begin
        
        if(counter == 1000000) begin
            
            if(state == 2'b00) begin
                // Initialization
                repeat(3) begin
                    lcd_e <= 0;
                    `WAIT
                    lcd_rs <= 0;
                    lcd_w <= 0;
                    data <= 4'b0011;
                    `WAIT
                    lcd_e <= 1;
                    `WAIT
                end
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0010;
                `WAIT
                lcd_e <= 1;
                `WAIT

                // Configuration
                // 1
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0010
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b1000
                `WAIT
                lcd_e <= 1;
                `WAIT
                
                // 2
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0110
                `WAIT
                lcd_e <= 1;
                `WAIT

                // 3
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b1100
                `WAIT
                lcd_e <= 1;
                `WAIT

                // 4
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0001
                `WAIT
                lcd_e <= 1;
                `WAIT
            end

            else if(state == 2'b01) begin
                
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b1000
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT

                for(i=0;i<128;i=i+8) begin
                    db[7:0] <= {line2[127-i],line2[126-i],line2[125-i],line2[124-i],line2[123-i],line2[122-i],line2[121-i],line2[120-i]};
                    lcd_e <= 0;
                    `WAIT
                    lcd_rs <= 1;
                    lcd_w <= 0;
                    data <= db[7:4];
                    `WAIT
                    lcd_e <= 1;
                    `WAIT
                    lcd_e <= 0;
                    `WAIT
                    lcd_rs <= 1;
                    lcd_w <= 0;
                    data <= db[3:0];
                    `WAIT
                    lcd_e <= 0;
                    `WAIT
                end

            end

            else if(state == 2'b10) begin

                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b1100
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT

            end

            else begin

                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b1000
                `WAIT
                lcd_e <= 1;
                `WAIT
                lcd_e <= 0;
                `WAIT
                lcd_rs <= 0;
                lcd_w <= 0;
                data <= 4'b0000
                `WAIT
                lcd_e <= 1;
                `WAIT

                for(i=0;i<128;i=i+8) begin
                    db[7:0] <= {line2[127-i],line2[126-i],line2[125-i],line2[124-i],line2[123-i],line2[122-i],line2[121-i],line2[120-i]};
                    lcd_e <= 0;
                    `WAIT
                    lcd_rs <= 1;
                    lcd_w <= 0;
                    data <= db[7:4];
                    `WAIT
                    lcd_e <= 1;
                    `WAIT
                    lcd_e <= 0;
                    `WAIT
                    lcd_rs <= 1;
                    lcd_w <= 0;
                    data <= db[3:0];
                    `WAIT
                    lcd_e <= 0;
                    `WAIT
                end

                lcd_e <= 0;
                `WAIT
               
            end

            state <= state+1;
            counter <= 0;
        end

        else begin
            counter <= counter+1;
        end

    end

endmodule
