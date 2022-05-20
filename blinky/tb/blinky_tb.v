// ======================
//  clk_divider test bench
// ======================

`default_nettype none

module blinky_tb();

//-- registers
reg clk_in = 0;
wire led;


//-- Instantiate test component
blinky #(.clk_freq_hz(10_000))
  dut(
    .clk(clk_in),
    .led0 (led)
  );

//-- Generate clock and enable at 4th second
always
  # 0.5 clk_in <= ~clk_in;


initial begin
  //-- Store Results
  $dumpfile("blinky_tb.vcd");
  $dumpvars(0, blinky_tb);

  # 100000 $display("END of simulation");
  $finish;
end

endmodule
