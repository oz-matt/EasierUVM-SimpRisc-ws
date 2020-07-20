// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_if.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Jul 21 03:15:04 2020
//=============================================================================
// Description: Signal interface for agent insgen
//=============================================================================

`ifndef INSGEN_IF_SV
`define INSGEN_IF_SV

interface insgen_if(); 

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;
  import insgen_pkg::*;

  logic clk;
  logic nreset;
  logic[31:0] instr_bus;
  logic[31:0] in_data_bus;
  logic[31:0] adc_in;
  wire mem_rw;
  logic[3:0] mem_wstrobe;
  logic[31:0] pc_out;
  logic[31:0] out_data_bus;
  logic[31:0] out_addr_bus;
  logic[31:0] out_data_bus_port2;
  logic[31:0] out_addr_bus_port2;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file insgen.tpl

endinterface : insgen_if

`endif // INSGEN_IF_SV

