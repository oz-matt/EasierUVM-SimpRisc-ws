// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug 18 23:43:32 2020
//=============================================================================
// Description: Driver for memw
//=============================================================================

`ifndef MEMW_DRIVER_SV
`define MEMW_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file memw.tpl

class memw_driver extends uvm_driver #(memw_obj);

  `uvm_component_utils(memw_driver)

  virtual memw_if vif;

  memw_config     m_config;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file memw.tpl

endclass : memw_driver 


function memw_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file memw.tpl

`endif // MEMW_DRIVER_SV

