// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jul 29 08:14:13 2020
//=============================================================================
// Description: Configuration for agent memw
//=============================================================================

`ifndef MEMW_CONFIG_SV
`define MEMW_CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file memw.tpl

class memw_config extends uvm_object;

  // Do not register config class with the factory

  virtual memw_if          vif;
                  
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file memw.tpl

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file memw.tpl

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file memw.tpl

endclass : memw_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file memw.tpl

function memw_config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file memw.tpl

`endif // MEMW_CONFIG_SV

