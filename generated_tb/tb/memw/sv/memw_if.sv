// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_if.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 04:12:53 2020
//=============================================================================
// Description: Signal interface for agent memw
//=============================================================================

`ifndef MEMW_IF_SV
`define MEMW_IF_SV

interface memw_if(); 

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;
  import memw_pkg::*;

  logic clk;
  logic nreset;
  wire mem_rw;
  logic[3:0] mem_wstrobe;
  logic[31:0] out_data_bus;
  logic[31:0] out_addr_bus;
  logic[31:0] out_data_bus_port2;
  logic[31:0] out_addr_bus_port2;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file memw_agent.tpl

endinterface : memw_if

`endif // MEMW_IF_SV

