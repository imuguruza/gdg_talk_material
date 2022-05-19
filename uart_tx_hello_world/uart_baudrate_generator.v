module uart_baudrate_generator #(parameter divisior = 6) // # 12Mhz / (16 * Baudrate) (Baudrate = 115200)
    (
    input wire clk, 
    input wire reset,
    output reg uart_tick = 1'b0
    );

    reg [15:0] counter = 6'b0;

    always@ (posedge clk) begin
        if (reset) begin
            counter <= 6'b0;
            uart_tick <= 1'b0;
        end
        else if (counter == divisior - 1) begin
            counter <= 6'b0;
            uart_tick <= 1'b1;
        end
        else begin
            counter <= counter + 6'b1;
            uart_tick <= 1'b0;
        end
    end

endmodule
