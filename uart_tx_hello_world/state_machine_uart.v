// Quartus Prime Verilog Template
// 4-State Moore state machine

// A Moore machine's outputs are dependent only on the current state.
// The output is written only when the state changes.  (State
// transitions are synchronous.)

module state_machine
(
	input	wire clk, reset, en, tx_done,
	output reg		  tx_start,
	output reg [7:0] tx_data_out
);

	// Declare state register
	reg		[3:0]state = S;
	//assign 	w_state = state;

	// Declare states
	localparam  S=0, S0 = 1, S1 = 2, S2 = 3, S3 = 4, S4 = 5, S5 = 6, S6 = 7, S7 =8, S8=9, S9=10, S10 = 47, S11=11;

	// Output depends only on the state
	always @ (state) begin
		case (state)
			S:
				begin
				tx_data_out = 8'h00;
				tx_start 	= 1'b0;
				end
			S0:
				begin
				tx_data_out = "H";
				tx_start 	= 1'b1;
				end
			S1:
				begin
				tx_data_out = "e";
				tx_start 	= 1'b1;
				end
			S2:
				begin
				tx_data_out = "l";
				tx_start 	= 1'b1;
				end
			S3:
				begin
				tx_data_out = "l";
				tx_start 	= 1'b1;
				end
			S4:
				begin
				tx_data_out = "o";
				tx_start 	= 1'b1;
				end
			S5:
				begin
				tx_data_out = " ";
				tx_start 	= 1'b1;
				end
			S6:
				begin
				tx_data_out = "W";
				tx_start 	= 1'b1;
				end
			S7:
				begin
				tx_data_out = "o";
				tx_start 	= 1'b1;
				end
			S8:
				begin
				tx_data_out = "r";
				tx_start 	= 1'b1;
				end
			S9:
				begin
				tx_data_out = "l";
				tx_start 	= 1'b1;
				end

			S10:
				begin
				tx_data_out = "d";
				tx_start 	= 1'b1;
				end

			S11:
				begin
				tx_data_out = "!";
				tx_start 	= 1'b1;
				end

			default:
				begin
				tx_data_out = 8'h00;
				tx_start 	= 1'b0;
				end

		endcase
	end

	// Determine the next state
always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S;
		else
		begin
			case (state)
				S:
					if		(en) 	state <= S0;
					else 			state <= S;

				S0:
					if		(tx_done)	state <= S1;
					else 					state <= S0;

				S1:
					if		(tx_done)	state <= S2;
					else					state <= S1;
				S2:
					if		(tx_done)	state <= S3;
					else					state <= S2;
				S3:
					if 	(tx_done)	state <= S4;
					else					state <= S3;
				S4:
					if 	(tx_done)	state <= S5;
					else					state <= S4;
				S5:
					if 	(tx_done)	state <= S6;
					else					state <= S5;
				S6:
					if 	(tx_done)	state <= S7;
					else					state <= S6;
				S7:
					if 	(tx_done)	state <= S8;
					else					state <= S7;
				S8:
					if 	(tx_done)	state <= S9;
					else					state <= S8;
				S9:
					if 	(tx_done)	state <= S10;
					else					state <= S9;

				S10:
					if		(tx_done)	state <= S11;
					else 						state <= S10;

				S11:
					if		(tx_done)	state <= S12;
					else						state <= S;

				default: 				state <= S;

			endcase
		end
end

endmodule
