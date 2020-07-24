// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memr_if.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:06:54 2020
//=============================================================================
// Description: Signal interface for agent memr
//=============================================================================

`ifndef MEMR_IF_SV
`define MEMR_IF_SV

interface memr_if(); 

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;
  import memr_pkg::*;

  logic clk;
  logic nreset;
  logic mem_rw;
  logic[31:0] out_addr_bus;
  logic[31:0] in_data_bus;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file memr.tpl

endinterface : memr_if

`endif // MEMR_IF_SV

