// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Thu Jul 16 08:01:04 2020
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;

  `include "th_define_clk_and_nreset.sv"

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  insgen_if  insgen_if_0 ();

  soc_top uut (
    .clk               (insgen_if_0.clk),
    .nreset            (insgen_if_0.nreset),
    .instr_bus         (insgen_if_0.instr_bus),
    .in_data_bus       (insgen_if_0.in_data_bus),
    .adc_in            (insgen_if_0.adc_in),
    .mem_rw            (insgen_if_0.mem_rw),
    .mem_wstrobe       (insgen_if_0.mem_wstrobe),
    .pc_out            (insgen_if_0.pc_out),
    .out_data_bus      (insgen_if_0.out_data_bus),
    .out_addr_bus      (insgen_if_0.out_addr_bus),
    .out_data_bus_port2(insgen_if_0.out_data_bus_port2),
    .out_addr_bus_port2(insgen_if_0.out_addr_bus_port2)
  );

endmodule

