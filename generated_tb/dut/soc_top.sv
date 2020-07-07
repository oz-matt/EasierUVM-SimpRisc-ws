
module soc_top(
	input logic clk,
	input logic nreset,
	input logic[31:0] data_bus,
	input logic[31:0] adc_in,
	output logic[31:0] addr_bus
);
	
	dut_top dut_top_inst(.*);
	
endmodule