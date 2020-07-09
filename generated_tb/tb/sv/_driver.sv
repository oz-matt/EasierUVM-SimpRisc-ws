// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: _driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 10 01:43:41 2020
//=============================================================================
// Description: Driver for 
//=============================================================================

`ifndef _DRIVER_SV
`define _DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file 

class _driver extends uvm_driver #();

  `uvm_component_utils(_driver)

  virtual  vif;

  _config     m_config;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file 

endclass : _driver 


function _driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file 

`endif // _DRIVER_SV

