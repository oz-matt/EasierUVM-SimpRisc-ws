// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_if.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Jun 29 06:36:41 2020
//=============================================================================
// Description: Signal interface for agent insgen
//=============================================================================

`ifndef INSGEN_IF_SV
`define INSGEN_IF_SV

interface insgen_if(); 

  timeunit      1ns;
  timeprecision 1ps;

  import insgen_pkg::*;

  logic clk;
  logic nreset;
  logic[31:0] data_bus;
  logic[31:0] addr_bus;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file insgen.tpl

endinterface : insgen_if

`endif // INSGEN_IF_SV

