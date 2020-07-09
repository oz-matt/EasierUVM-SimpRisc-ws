// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: _monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 10 01:43:41 2020
//=============================================================================
// Description: Monitor for 
//=============================================================================

`ifndef _MONITOR_SV
`define _MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file 

class _monitor extends uvm_monitor;

  `uvm_component_utils(_monitor)

  virtual  vif;

  _config     m_config;

  uvm_analysis_port #() analysis_port;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting monitor_inc_inside_class in file 

endclass : _monitor 


function _monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


// You can insert code here by setting monitor_inc_after_class in file 

`endif // _MONITOR_SV

