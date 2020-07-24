// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memr_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:06:54 2020
//=============================================================================
// Description: Configuration for agent memr
//=============================================================================

`ifndef MEMR_CONFIG_SV
`define MEMR_CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file memr.tpl

class memr_config extends uvm_object;

  // Do not register config class with the factory

  virtual memr_if          vif;
                  
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file memr.tpl

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file memr.tpl

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file memr.tpl

endclass : memr_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file memr.tpl

function memr_config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file memr.tpl

`endif // MEMR_CONFIG_SV

