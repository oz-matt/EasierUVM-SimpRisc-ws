	logic clk = 0;
	logic nreset;
	
	real frq, mag, vra, rdy;
	
	byte ram[int];

	always #10 clk = ~clk;

	initial
	begin
		nreset = 0;         // Active low reset in this example
		#15 nreset = 1;
	end
	
	
	cpll180nm cpll(frq, mag, vra, rdy);
	

	assign insgen_if_0.pllrdy = rdy;
	assign insgen_if_0.pllfreq = frq;
	assign insgen_if_0.pllmag = mag;
	assign insgen_if_0.pllvra = vra;
	assign insgen_if_0.clk = clk;
	assign insgen_if_0.nreset = nreset;
	assign memw_if_0.clk = clk;
	assign memw_if_0.nreset = nreset;

	always @(posedge clk) begin
		if(memw_if_0.mem_rw) begin
			if(memw_if_0.mem_wstrobe & 'b0001) ram[memw_if_0.out_addr_bus] <= memw_if_0.out_data_bus[7:0];
			if(memw_if_0.mem_wstrobe & 'b0010) ram[memw_if_0.out_addr_bus + 1] <= memw_if_0.out_data_bus[15:8];
			if(memw_if_0.mem_wstrobe & 'b0100) ram[memw_if_0.out_addr_bus + 2] <= memw_if_0.out_data_bus[23:16];
			if(memw_if_0.mem_wstrobe & 'b1000) ram[memw_if_0.out_addr_bus + 3] <= memw_if_0.out_data_bus[31:24];
		end
		else begin
			if(memw_if_0.mem_wstrobe & 'b0001) memw_if_0.in_data_bus[7:0] <= ram[memw_if_0.out_addr_bus];
			if(memw_if_0.mem_wstrobe & 'b0010) memw_if_0.in_data_bus[15:8] <= ram[memw_if_0.out_addr_bus + 1];
			if(memw_if_0.mem_wstrobe & 'b0100) memw_if_0.in_data_bus[23:16] <= ram[memw_if_0.out_addr_bus + 2];
			if(memw_if_0.mem_wstrobe & 'b1000) memw_if_0.in_data_bus[31:24] <= ram[memw_if_0.out_addr_bus + 3];
		end
			
	end

