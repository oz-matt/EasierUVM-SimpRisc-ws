// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:14:32 2020
//=============================================================================
// Description: Monitor for memw
//=============================================================================

`ifndef MEMW_MONITOR_SV
`define MEMW_MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file memw.tpl

class memw_monitor extends uvm_monitor;

  `uvm_component_utils(memw_monitor)

  virtual memw_if vif;

  memw_config     m_config;

  uvm_analysis_port #(memw_obj) analysis_port;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting monitor_inc_inside_class in file memw.tpl

endclass : memw_monitor 


function memw_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


// You can insert code here by setting monitor_inc_after_class in file memw.tpl

`endif // MEMW_MONITOR_SV

