// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-04-18-EP on Sat Jun 27 20:01:44 2020
//=============================================================================
// Description: Configuration for agent insgen
//=============================================================================

`ifndef INSGEN_CONFIG_SV
`define INSGEN_CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file insgen.tpl

class insgen_config extends uvm_object;

  // Do not register config class with the factory

  virtual insgen_if        vif;
                  
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file insgen.tpl

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file insgen.tpl

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file insgen.tpl

endclass : insgen_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file insgen.tpl

function insgen_config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file insgen.tpl

`endif // INSGEN_CONFIG_SV

