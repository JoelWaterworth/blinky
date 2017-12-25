module top (clk_in, led_green_out, led_red);  
    input clk_in;
    output led_green_out;
    output [3:0] led_red;


    reg [23:0] counter;
    assign led_green_out = counter[23];
    assign led_red[3:0] = counter[23:20];

    always @ (posedge clk_in) begin
        counter <= counter + 1;
    end
endmodule
//sudo make prog to run the code
