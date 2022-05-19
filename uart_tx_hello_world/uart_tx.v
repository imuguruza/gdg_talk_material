module uart_tx
    #(
        parameter DBIT = 8,           // # data bits
                  S_TICK_LIM = 16,    // # ticks for bits
		  STOP_BITS_LIM = 16  // # ticks for stop bits (One bit=16, 1.5 bit=24 Two bit=32)
    )

    (
    input wire clk, reset, tx_start,
    output reg tx = 1'b1,
    input wire  s_tick,
    output reg tx_done_tick = 1'b0,
    input wire [7:0] data_in
    );

    // symbolic state declaration
    localparam [1:0] idle = 2'b00,
                     start = 2'b01,
                     data = 2'b10,
                     stop = 2'b11;

	reg [1:0] state = idle;
	reg [2:0] bit_counter = 3'b0;
	reg [3:0] s_tick_counter = 4'b0;
	reg [7:0] tx_data_reg = 8'b0;

	always@ (posedge clk) begin

		if (reset) begin

			tx_done_tick <= 1'b0;
			tx <= 1'b1;
			s_tick_counter <= 4'b0;
			bit_counter <= 3'b0;
			state <= idle;

		end
		else begin

			case (state)

				idle: begin
					tx <= 1'b1;
					tx_done_tick <= 1'b0;
					if (tx_start) begin
						tx_data_reg <= data_in;
						state <= start;
						tx <= 1'b0;
					end
				end

				start: begin
					tx <= 1'b0;
					if (s_tick) begin
						if (s_tick_counter == S_TICK_LIM - 1) begin
							tx <= tx_data_reg[0];
							s_tick_counter <= 4'b0;
							state <= data;
						end
						else
							s_tick_counter <= s_tick_counter + 1;
					end
				end

				data: begin
					tx <= tx_data_reg[0];
					if (s_tick) begin
						if (s_tick_counter == S_TICK_LIM - 1) begin
							s_tick_counter <= 4'b0;
							tx_data_reg <= tx_data_reg >> 1;
							if (bit_counter == DBIT - 1) begin
								bit_counter <= 3'b0;
								state <= stop;
								tx <= 1'b1;
							end
							else
								bit_counter <= bit_counter + 1;
						end
						else
							s_tick_counter <= s_tick_counter + 1;
					end
				end

				stop: begin
					tx <= 1'b1;
					if (s_tick) begin
						if (s_tick_counter == STOP_BITS_LIM - 1) begin
							s_tick_counter <= 4'b0;
							tx_done_tick <= 1'b1;
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
