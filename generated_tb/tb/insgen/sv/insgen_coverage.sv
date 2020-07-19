// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_coverage.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Jul 20 06:19:22 2020
//=============================================================================
// Description: Coverage for agent insgen
//=============================================================================

`ifndef INSGEN_COVERAGE_SV
`define INSGEN_COVERAGE_SV

// You can insert code here by setting agent_cover_inc_before_class in file insgen.tpl

class insgen_coverage extends uvm_subscriber #(trans);

  `uvm_component_utils(insgen_coverage)

  insgen_config m_config;    
  bit           m_is_covered;
  trans         m_item;
     
  // Start of inlined include file generated_tb/tb/include/inlines/insgen_cover_inc.sv
  covergroup m_cov;
  	option.per_instance = 1;
  	cp_data: coverpoint m_item.adc_data {
  		bins zero = {0};
  		bins one  = {1};
  		bins positive = { [1: 127] };
  		option.at_least = 16;
  	}
  endgroup
  
  // End of inlined include file

  // You can remove new, write, and report_phase by setting agent_cover_generate_methods_inside_class = no in file insgen.tpl

  extern function new(string name, uvm_component parent);
  extern function void write(input trans t);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

  // You can insert code here by setting agent_cover_inc_inside_class in file insgen.tpl

endclass : insgen_coverage 


// You can remove new, write, and report_phase by setting agent_cover_generate_methods_after_class = no in file insgen.tpl

function insgen_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_is_covered = 0;
  m_cov = new();
endfunction : new


function void insgen_coverage::write(input trans t);
  if (m_config.coverage_enable)
  begin
    m_item = t;
    m_cov.sample();
    // Check coverage - could use m_cov.option.goal instead of 100 if your simulator supports it
    if (m_cov.get_inst_coverage() >= 100) m_is_covered = 1;
  end
endfunction : write


function void insgen_coverage::build_phase(uvm_phase phase);
  if (!uvm_config_db #(insgen_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "insgen config not found")
endfunction : build_phase


function void insgen_coverage::report_phase(uvm_phase phase);
  if (m_config.coverage_enable)
    `uvm_info(get_type_name(), $sformatf("Coverage score = %3.1f%%", m_cov.get_inst_coverage()), UVM_MEDIUM)
  else
    `uvm_info(get_type_name(), "Coverage disabled for this agent", UVM_MEDIUM)
endfunction : report_phase


// You can insert code here by setting agent_cover_inc_after_class in file insgen.tpl

`endif // INSGEN_COVERAGE_SV

