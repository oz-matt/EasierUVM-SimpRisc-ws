// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: _config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 10 01:43:41 2020
//=============================================================================
// Description: Configuration for agent 
//=============================================================================

`ifndef _CONFIG_SV
`define _CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file 

class _config extends uvm_object;

  // Do not register config class with the factory

  virtual _if              vif;
                  
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file 

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file 

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file 

endclass : _config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file 

function _config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file 

`endif // _CONFIG_SV

