// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memr_monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:06:54 2020
//=============================================================================
// Description: Monitor for memr
//=============================================================================

`ifndef MEMR_MONITOR_SV
`define MEMR_MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file memr.tpl

class memr_monitor extends uvm_monitor;

  `uvm_component_utils(memr_monitor)

  virtual memr_if vif;

  memr_config     m_config;

  uvm_analysis_port #(memr_obj) analysis_port;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting monitor_inc_inside_class in file memr.tpl

endclass : memr_monitor 


function memr_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


// You can insert code here by setting monitor_inc_after_class in file memr.tpl

`endif // MEMR_MONITOR_SV

