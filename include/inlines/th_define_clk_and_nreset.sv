  logic clock = 0;
  logic reset;

  always #10 clock = ~clock;

  initial
  begin
    reset = 0;         // Active low reset in this example
    #75 reset = 1;
  end

  assign insgen_if_0.clk = clock;
  assign insgen_if_0.nreset = reset;
