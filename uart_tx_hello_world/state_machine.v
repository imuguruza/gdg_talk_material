// Quartus Prime Verilog Template
// 4-State Moore state machine

// A Moore machine's outputs are dependent only on the current state.
// The output is written only when the state changes.  (State
// transitions are synchronous.)

module state_machine
(
	input	wire clk, reset, en, tx_done,
	input wire [7:0] data_in_A,
	input wire [7:0] data_in_B,
	input wire [7:0] data_in_C,
	input wire [7:0] data_in_D,
	input wire [7:0] data_in_E,
	input wire [7:0] data_in_F,
	input wire [7:0] data_in_G,
	input wire [7:0] data_in_H,
	input wire [7:0] data_in_I,
	input wire [7:0] data_in_J,
	input wire [7:0] data_in_K,
	input wire [7:0] data_in_L,
	input wire [7:0] data_in_M,
	input wire [7:0] data_in_N,
	input wire [7:0] data_in_O,
	input wire [7:0] data_in_P,
	input wire [7:0] data_in_Q,
	input wire [7:0] data_in_R,
	input wire [7:0] data_in_S,
	input wire [7:0] data_in_T,
	input wire [7:0] data_in_U,
	input wire [7:0] data_in_V,
	input wire [7:0] data_in_Y,
	output reg		  tx_start,
	output reg [7:0] tx_data_out
);

	// Declare state register
	reg		[6:0]state = S;
	//assign 	w_state = state;

	// Declare states
	localparam  S=0, S0 = 1, S1 = 2, S2 = 3, S3 = 4, S4 = 5, S5 = 6, S6 = 7, S7 =8, S8=9, S9=10, S10 = 47,
					S11=11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18, 
					S19 =19, S20=20, S21=21, S22 = 22, S23 = 23, S24 = 24, S25 = 25, S26 = 26, 
					S27=27, S28 = 28, S29 = 29, S30 = 30, S31 = 31, S32 = 32, S33 = 33, S34 = 34, 
					S35=35, S36 = 36, S37 = 37, S38 = 38, S39 = 39, S40 = 40, S41 = 41, S42 = 42, S43 = 43, S44 = 44, S45 = 45 ;

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
				tx_data_out = 8'hFF;			//1 FIBER CODE
				tx_start 	= 1'b1;
				end
			S1:
				begin
				tx_data_out = data_in_A;	//1 FIBER ERROR COUNT
				tx_start 	= 1'b1;
				end
			S2:
				begin
				tx_data_out = 8'hFE;			//2 FIBER CODE
				tx_start 	= 1'b1;
				end
			S3:
				begin
				tx_data_out = data_in_B;	//2 FIBER ERROR CODE
				tx_start 	= 1'b1;
				end
			S4:
				begin
				tx_data_out = 8'hFD;			// Voltage Monitor CODE 
				tx_start 	= 1'b1;
				end
			S5:
				begin
				tx_data_out = data_in_C;	// Voltage Monitor Error Count
				tx_start 	= 1'b1;
				end
			S6:
				begin
				tx_data_out = 8'hFC;			// EEPROM Code
				tx_start 	= 1'b1;
				end
			S7:
				begin
				tx_data_out = data_in_D;	// EEPROM Error Count
				tx_start 	= 1'b1;
				end
			S8:
				begin
				tx_data_out = 8'hFB;			// DIO 1 Error CODE
				tx_start 	= 1'b1;
				end
			S9:
				begin
				tx_data_out = data_in_E;	// DIO 1 Error Count
				tx_start 	= 1'b1;
				end
				
			S10:
				begin
				tx_data_out = 8'hFA;			// DIO 2 Error CODE
				tx_start 	= 1'b1;
				end

			S11:
				begin
				tx_data_out = data_in_F;	// DIO 2 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S12:
				begin
				tx_data_out = 8'hF9;			// DIO 3 Error CODE
				tx_start 	= 1'b1;
				end

			S13:
				begin
				tx_data_out = data_in_G;	// DIO 3 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S14:
				begin
				tx_data_out = 8'hF8;			// DIO 4 Error CODE
				tx_start 	= 1'b1;
				end

			S15:
				begin
				tx_data_out = data_in_H;	// DIO 4 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S16:
				begin
				tx_data_out = 8'hF7;			// DIO 5 Error CODE
				tx_start 	= 1'b1;
				end

			S17:
				begin
				tx_data_out = data_in_I;	// DIO 5 ERROR COUNT
				tx_start 	= 1'b1;
				end			
			
			S18:
				begin
				tx_data_out = 8'hF6;			// DIO 6 Error CODE
				tx_start 	= 1'b1;
				end

			S19:
				begin
				tx_data_out = data_in_J;	// DIO 6 ERROR COUNT
				tx_start 	= 1'b1;
				end

			S20:
				begin
				tx_data_out = 8'hF5;			// DIO 7 Error CODE
				tx_start 	= 1'b1;
				end

			S21:
				begin
				tx_data_out = data_in_K;	// DIO 7 ERROR COUNT
				tx_start 	= 1'b1;
				end				
				
			S22:
				begin
				tx_data_out = 8'hF4;			// DIO 8 Error CODE
				tx_start 	= 1'b1;
				end

			S23:
				begin
				tx_data_out = data_in_L;	// DIO 8 ERROR COUNT
				tx_start 	= 1'b1;
				end	
				
			S24:
				begin
				tx_data_out = 8'hF3;			// DIO 9 Error CODE
				tx_start 	= 1'b1;
				end

			S25:
				begin
				tx_data_out = data_in_M;	// DIO 9 ERROR COUNT
				tx_start 	= 1'b1;
				end
										
				
			S26:
				begin
				tx_data_out = 8'hF2;			// DIO 10 Error CODE
				tx_start 	= 1'b1;
				end

			S27:
				begin
				tx_data_out = data_in_N;	// DIO 10 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S28:
				begin
				tx_data_out = 8'hF1;			// DIO 11 Error CODE
				tx_start 	= 1'b1;
				end

			S29:
				begin
				tx_data_out = data_in_O;	// DIO 11 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S30:
				begin
				tx_data_out = 8'hF0;			// DIO 12 Error CODE
				tx_start 	= 1'b1;
				end

			S31:
				begin
				tx_data_out = data_in_P;	// DIO 12 ERROR COUNT
				tx_start 	= 1'b1;
				end
			
			S32:
				begin
				tx_data_out = 8'hEF;			// DIO 13 Error CODE
				tx_start 	= 1'b1;
				end

			S33:
				begin
				tx_data_out = data_in_Q;	// DIO 13 ERROR COUNT
				tx_start 	= 1'b1;
				end			
			
			S34:
				begin
				tx_data_out = 8'hEE;			// DIO 14 Error CODE
				tx_start 	= 1'b1;
				end

			S35:
				begin
				tx_data_out = data_in_R;	// DIO 14 ERROR COUNT
				tx_start 	= 1'b1;
				end

			S36:
				begin
				tx_data_out = 8'hED;			// DIO 15 Error CODE
				tx_start 	= 1'b1;
				end

			S37:
				begin
				tx_data_out = data_in_S;	// DIO 15 ERROR COUNT
				tx_start 	= 1'b1;
				end				
				
			S38:
				begin
				tx_data_out = 8'hEC;			// DIO 16 Error CODE
				tx_start 	= 1'b1;
				end

			S39:
				begin
				tx_data_out = data_in_T;	// DIO 16 ERROR COUNT
				tx_start 	= 1'b1;
				end	
				
			S40:
				begin
				tx_data_out = 8'hEB;			// DIO 17 Error CODE
				tx_start 	= 1'b1;
				end

			S41:
				begin
				tx_data_out = data_in_U;	// DIO 17 ERROR COUNT
				tx_start 	= 1'b1;
				end				
				
			S42:
				begin
				tx_data_out = 8'hEA;			// DIO 18 Error CODE
				tx_start 	= 1'b1;
				end

			S43:
				begin
				tx_data_out = data_in_V;	// DIO 18 ERROR COUNT
				tx_start 	= 1'b1;
				end				
				
			S44:
				begin
				tx_data_out = 8'hE9;			// DIO 19 Error CODE
				tx_start 	= 1'b1;
				end

			S45:
				begin
				tx_data_out = data_in_Y;	// DIO 19 ERROR COUNT
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
					else 					state <= S10;
						
				S11:
					if		(tx_done)	state <= S12;
					else					state <= S11;
				S12:
					if		(tx_done)	state <= S13;
					else					state <= S12;
				S13:
					if 	(tx_done)	state <= S14;
					else					state <= S13;
				S14:
					if 	(tx_done)	state <= S15;
					else					state <= S14;
				S15:
					if 	(tx_done)	state <= S16;
					else					state <= S15;
				S16:
					if 	(tx_done)	state <= S17;
					else					state <= S16;
				S17:
					if 	(tx_done)	state <= S18;
					else					state <= S17;
				S18:
					if 	(tx_done)	state <= S19;
					else					state <= S18;
				S19:
					if 	(tx_done)	state <= S20;
					else					state <= S19;			
				S20:
					if		(tx_done)	state <= S21;
					else 					state <= S20;
						
				S21:
					if		(tx_done)	state <= S22;
					else					state <= S21;
				S22:
					if		(tx_done)	state <= S23;
					else					state <= S22;
				S23:
					if 	(tx_done)	state <= S24;
					else					state <= S23;
				S24:
					if 	(tx_done)	state <= S25;
					else					state <= S24;
				S25:
					if 	(tx_done)	state <= S26;
					else					state <= S25;
				S26:
					if 	(tx_done)	state <= S27;
					else					state <= S26;
				S27:
					if 	(tx_done)	state <= S28;
					else					state <= S27;
				S28:
					if 	(tx_done)	state <= S29;
					else					state <= S28;
				S29:
					if 	(tx_done)	state <= S30;
					else					state <= S29;

				S30:
					if		(tx_done)	state <= S31;
					else 					state <= S30;
						
				S31:
					if		(tx_done)	state <= S32;
					else					state <= S31;
				S32:
					if		(tx_done)	state <= S33;
					else					state <= S32;
				S33:
					if 	(tx_done)	state <= S34;
					else					state <= S33;
				S34:
					if 	(tx_done)	state <= S35;
					else					state <= S34;
				S35:
					if 	(tx_done)	state <= S36;
					else					state <= S35;
				S36:
					if 	(tx_done)	state <= S37;
					else					state <= S36;
				S37:
					if 	(tx_done)	state <= S38;
					else					state <= S37;
				S38:
					if 	(tx_done)	state <= S39;
					else					state <= S38;
				S39:
					if 	(tx_done)	state <= S40;
					else					state <= S39;
			
				S40:
					if		(tx_done)	state <= S41;
					else 					state <= S40;
						
				S41:
					if		(tx_done)	state <= S42;
					else					state <= S41;
				S42:
					if		(tx_done)	state <= S43;
					else					state <= S42;
				S43:
					if 	(tx_done)	state <= S44;
					else					state <= S43;
				S44:
					if 	(tx_done)	state <= S45;
					else					state <= S44;
				S45:
					if 	(tx_done)	state <= S;
					else					state <= S45;
					
				default: 				state <= S;
				
			endcase
		end
end

endmodule
