// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jul 29 08:14:13 2020
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;

  // Start of inlined include file generated_tb/tb/include/inlines/th_define_clk_and_nreset.sv
  	logic clk = 0;
  	logic nreset;
  
  	always #10 clk = ~clk;
  
  	initial
  	begin
  		nreset = 0;         // Active low reset in this example
  		#15 nreset = 1;
  	end
  
  	assign insgen_if_0.clk = clk;
  	assign insgen_if_0.nreset = nreset;
  // End of inlined include file

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  insgen_if  insgen_if_0 ();
  memw_if    memw_if_0 ();  

  soc_top uut (
    .instr_bus         (insgen_if_0.instr_bus),
    .pc_out            (insgen_if_0.pc_out),
    .adc_in            (insgen_if_0.adc_in),
    .mem_rw            (memw_if_0.mem_rw),
    .memclk            (memw_if_0.memclk),
    .mem_wstrobe       (memw_if_0.mem_wstrobe),
    .out_data_bus      (memw_if_0.out_data_bus),
    .out_addr_bus      (memw_if_0.out_addr_bus),
    .out_data_bus_port2(memw_if_0.out_data_bus_port2),
    .out_addr_bus_port2(memw_if_0.out_addr_bus_port2),
    .in_data_bus       (memw_if_0.in_data_bus),
    .clk               (clk),
    .nreset            (nreset)
  );

endmodule

