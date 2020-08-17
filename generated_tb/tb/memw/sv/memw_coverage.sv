// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_coverage.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug 18 07:39:50 2020
//=============================================================================
// Description: Coverage for agent memw
//=============================================================================

`ifndef MEMW_COVERAGE_SV
`define MEMW_COVERAGE_SV

// You can insert code here by setting agent_cover_inc_before_class in file memw.tpl

class memw_coverage extends uvm_subscriber #(memw_obj);

  `uvm_component_utils(memw_coverage)

  memw_config m_config;    
  bit         m_is_covered;
  memw_obj    m_item;
     
  // You can replace covergroup m_cov by setting agent_cover_inc in file memw.tpl
  // or remove covergroup m_cov by setting agent_cover_generate_methods_inside_class = no in file memw.tpl

  covergroup m_cov;
    option.per_instance = 1;
    // You may insert additional coverpoints here ...

    cp_out_data_bus: coverpoint m_item.out_data_bus;
    //  Add bins here if required

    cp_out_addr_bus: coverpoint m_item.out_addr_bus;
    //  Add bins here if required

    cp_in_data_bus: coverpoint m_item.in_data_bus;
    //  Add bins here if required

    cp_mem_rw: coverpoint m_item.mem_rw;
    //  Add bins here if required

    cp_mem_wstrobe: coverpoint m_item.mem_wstrobe;
    //  Add bins here if required

  endgroup

  // You can remove new, write, and report_phase by setting agent_cover_generate_methods_inside_class = no in file memw.tpl

  extern function new(string name, uvm_component parent);
  extern function void write(input memw_obj t);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

  // You can insert code here by setting agent_cover_inc_inside_class in file memw.tpl

endclass : memw_coverage 


// You can remove new, write, and report_phase by setting agent_cover_generate_methods_after_class = no in file memw.tpl

function memw_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_is_covered = 0;
  m_cov = new();
endfunction : new


function void memw_coverage::write(input memw_obj t);
  if (m_config.coverage_enable)
  begin
    m_item = t;
    m_cov.sample();
    // Check coverage - could use m_cov.option.goal instead of 100 if your simulator supports it
    if (m_cov.get_inst_coverage() >= 100) m_is_covered = 1;
  end
endfunction : write


function void memw_coverage::build_phase(uvm_phase phase);
  if (!uvm_config_db #(memw_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "memw config not found")
endfunction : build_phase


function void memw_coverage::report_phase(uvm_phase phase);
  if (m_config.coverage_enable)
    `uvm_info(get_type_name(), $sformatf("Coverage score = %3.1f%%", m_cov.get_inst_coverage()), UVM_MEDIUM)
  else
    `uvm_info(get_type_name(), "Coverage disabled for this agent", UVM_MEDIUM)
endfunction : report_phase


// You can insert code here by setting agent_cover_inc_after_class in file memw.tpl

`endif // MEMW_COVERAGE_SV

