	logic clk = 0;
	logic nreset;

	always #10 clk = ~clk;

	initial
	begin
		nreset = 0;         // Active low reset in this example
		#75 nreset = 1;
	end

	assign insgen_if_0.clk = clk;
	assign insgen_if_0.nreset = nreset;
