// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memr_driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:06:54 2020
//=============================================================================
// Description: Driver for memr
//=============================================================================

`ifndef MEMR_DRIVER_SV
`define MEMR_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file memr.tpl

class memr_driver extends uvm_driver #(memr_obj);

  `uvm_component_utils(memr_driver)

  virtual memr_if vif;

  memr_config     m_config;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file memr.tpl

endclass : memr_driver 


function memr_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file memr.tpl

`endif // MEMR_DRIVER_SV

