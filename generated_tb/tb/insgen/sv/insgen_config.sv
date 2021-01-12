// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 13 00:50:24 2021
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

  boolean init_cpu_regs_with_rand_vals;
  instr_category_bm allowed_instr_types;
  int init_cpu_regs_ctr = 0;
  boolean on_reg_init_lui = true;
  int gictr = 0;
  instruction_base_si ic[$];

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file insgen.tpl

  extern function new(string name = "");

  // Start of inlined include file generated_tb/tb/include/inlines/config_cextern.sv
  extern function init_params(boolean init_rx, instr_category_bm icbm);  // End of inlined include file

endclass : insgen_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file insgen.tpl

function insgen_config::new(string name = "");
  super.new(name);
endfunction : new


// Start of inlined include file generated_tb/tb/include/inlines/config_new.sv

	function insgen_config::init_params(boolean init_rx, instr_category_bm icbm);
		this.init_cpu_regs_with_rand_vals = init_rx;
		this.allowed_instr_types = icbm;
	endfunction
// End of inlined include file

`endif // INSGEN_CONFIG_SV

