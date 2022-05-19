module one_hz_enable_generator
  #(parameter CLK_FREQ_HZ = 12000000)
   (input wire clk,
	 input wire reset,
    output reg o_en = 1'b0);

   reg [$clog2(CLK_FREQ_HZ)-1:0] count = 0;

   always @(posedge clk) begin
		if (reset) begin
			count <= 0;
			o_en <= 1'b0;
		end
		else if (count == CLK_FREQ_HZ-1) begin
			o_en <= 1'b1;
			count <= 0;
      end
		else begin
			o_en <= 1'b0;
			count <= count + 1;
		end
   end

endmodule
