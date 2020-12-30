// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_test.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Dec 28 10:02:32 2020
//=============================================================================
// Description: Test class for top (included in package top_test_pkg)
//=============================================================================

`ifndef TOP_TEST_SV
`define TOP_TEST_SV

// You can insert code here by setting test_inc_before_class in file common.tpl

class top_test extends uvm_test;

  `uvm_component_utils(top_test)

  top_env m_env;

  extern function new(string name, uvm_component parent);

  // You can remove build_phase method by setting test_generate_methods_inside_class = no in file common.tpl

  extern function void build_phase(uvm_phase phase);

  // You can insert code here by setting test_inc_inside_class in file common.tpl

endclass : top_test


function top_test::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can remove build_phase method by setting test_generate_methods_after_class = no in file common.tpl

function void top_test::build_phase(uvm_phase phase);

  // Start of inlined include file generated_tb/tb/include/inlines/test_prepend_build.sv
  
  
  // Each unique test must extend top_test and use a type override for a 
  // sequence extended from insgen_default_seq
  // End of inlined include file

  // You could modify any test-specific configuration object variables here



  m_env = top_env::type_id::create("m_env", this);

  // You can insert code here by setting test_append_to_build_phase in file common.tpl

endfunction : build_phase


// Start of inlined include file generated_tb/tb/include/inlines/include_tests.sv

`include "tests/test_direct_ins.sv"
`include "tests/test_rand_ins.sv"
// End of inlined include file

`endif // TOP_TEST_SV

