// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Jul 20 21:54:09 2020
//=============================================================================
// Description: Driver for insgen
//=============================================================================

`ifndef INSGEN_DRIVER_SV
`define INSGEN_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file insgen.tpl

class insgen_driver extends uvm_driver #(trans);

  `uvm_component_utils(insgen_driver)

  virtual insgen_if vif;

  insgen_config     m_config;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file insgen.tpl

endclass : insgen_driver 


function insgen_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file insgen.tpl

`endif // INSGEN_DRIVER_SV

