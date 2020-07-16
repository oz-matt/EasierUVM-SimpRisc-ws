
module soc_top(
	input logic clk,
	input logic nreset,
  input logic[31:0] instr_bus,
  input logic[31:0] in_data_bus,
	input logic[31:0] adc_in,
  output wire mem_rw,
  output logic[3:0] mem_wstrobe,
  output logic[31:0] pc_out,
	output logic[31:0] out_data_bus,
	output logic[31:0] out_addr_bus,
  output wire[31:0] out_data_bus_port2,
  output wire[31:0] out_addr_bus_port2
);
	
	dut_top dut_top_inst(.*);
	
endmodule

