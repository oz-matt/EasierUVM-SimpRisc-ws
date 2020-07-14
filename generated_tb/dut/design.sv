`include "masterif.sv"
`include "mdriver_int.sv"
`include "axil_int.sv"
`include "defines.sv"
`include "umem.sv"
`include "memslave.sv"
`include "axi_master_wrapper.sv"
`include "instruction_parser.sv"
`include "axi_mem.sv"
`include "sindrv.sv"
`include "lfsr5.sv"
`include "cpu.sv"
`include "soc_top.sv"


module dut_top(
	input logic clk,
	input logic nreset,
  input logic[31:0] instr_bus,
  input logic[31:0] in_data_bus,
  output logic[31:0] pc_out,
  output wire mem_rw,
  output logic[3:0] mem_wstrobe,
	input logic[31:0] adc_in,
	output logic[31:0] out_data_bus,
  output logic[31:0] out_addr_bus,
  output wire[31:0] out_data_bus_port2,
  output wire[31:0] out_addr_bus_port2
);
	
	
	mdriver_int#(32,32) vif(.*);
	axi_master_wrapper axi_master_wrapper_inst(.io(vif.slave), .mem(aximem_inst.axim));
	cpu cpu_inst(.*, .io(aximem_inst.mem));
	sindrv sindrv_inst(.io(vif.master), .adc_in(adc_in));
	aximem aximem_inst();
	
endmodule
