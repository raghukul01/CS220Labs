module lcd_driver_top(clk, lcd_rs, lcd_w, lcd_e, data);
    
    input clk;
    output lcd_rs,lcd_w,lcd_e;
    wire lcd_rs,lcd_w,lcd_e;
    output [3:0] data;
    wire [3:0] data;

    wire line1 = "WELCOME TO CSE, ";
    wire line2 = "IIT KANPUR      ";

    lcd_driver LCD (clk, line1, line2, lcd_rs, lcd_w, lcd_e, data);

endmodule
