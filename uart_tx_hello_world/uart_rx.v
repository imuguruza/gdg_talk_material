module uart_rx
    #(
        parameter DBIT = 8,           // # data bits
                  S_TICK_LIM = 16,    // # ticks for bits
		  STOP_BITS_LIM = 16  // # ticks for stop bits (One bit=16, 1.5 bit=24 Two bit=32)
    )

    (
    input wire clk,
    input wire reset,
    input wire rx,
    input wire s_tick,
    output reg rx_done_tick = 1'b0,
    output reg [7:0] data_out = 8'b0
    );

    // symbolic state declaration
    localparam [1:0] idle = 2'b00,
                     start = 2'b01,
                     data = 2'b10,
                     stop = 2'b11;

	reg [1:0] state = idle;
	reg [2:0] bit_counter = 3'b0;
	reg [3:0] s_tick_counter = 4'b0;
	//reg [7:0] tx_data_reg = 8'b0;

	always@ (posedge clk) begin

		if (reset) begin

			rx_done_tick <= 1'b0;
			s_tick_counter <= 4'b0;
			bit_counter <= 3'b0;
			data_out <= 8'b0;
			state <= idle;

		end
		else begin

			case (state)

				idle: begin
					rx_done_tick <= 1'b0;
					s_tick_counter <= 4'b0;
					if (~rx) begin
						state <= start;
					end
				end

				start: begin
					if (~rx) begin
						if (s_tick) begin
							if (s_tick_counter == (S_TICK_LIM / 2) - 1) begin
								s_tick_counter <= 4'b0;
								state <= data;
							end
							else
								s_tick_counter <= s_tick_counter + 1;
						end
					end
					else begin
						state <= idle;
					end
				end

				data: begin
					if (s_tick) begin
						if (s_tick_counter == S_TICK_LIM - 1) begin
							s_tick_counter <= 4'b0;
							data_out <= {rx, data_out[7:1]};
							if (bit_counter == DBIT - 1) begin
								bit_counter <= 3'b0;
								state <= stop;
							end
							else
								bit_counter <= bit_counter + 1;
						end
						else
							s_tick_counter <= s_tick_counter + 1;
					end
				end

				stop: begin
					if (s_tick) begin
						if (s_tick_counter == STOP_BITS_LIM - 1) begin
							s_tick_counter <= 4'b0;
							rx_done_tick <= 1'b1;
							state <= idle;
						end
						else
							s_tick_counter <= s_tick_counter + 1;
					end
				end

			endcase

		end

	end

endmodule
