// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-04-18-EP on Sat Jun 27 20:01:44 2020
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  timeunit      1ns;
  timeprecision 1ps;


  `include "th_define_clk_and_nreset.sv"

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  insgen_if  insgen_if_0 ();

  soc_top uut (
    .clk     (insgen_if_0.clk),
    .nreset  (insgen_if_0.nreset),
    .data_bus(insgen_if_0.data_bus),
    .addr_bus(insgen_if_0.addr_bus)
  );

endmodule

