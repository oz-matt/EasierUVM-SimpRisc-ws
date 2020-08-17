// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_test.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug 18 07:39:50 2020
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

  // Start of inlined include file generated_tb/tb/include/inlines/test_insert_config_afterc.sv
  extern function void start_of_simulation_phase(uvm_phase phase);  // End of inlined include file

endclass : top_test


function top_test::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can remove build_phase method by setting test_generate_methods_after_class = no in file common.tpl

function void top_test::build_phase(uvm_phase phase);

  // You can insert code here by setting test_prepend_to_build_phase in file common.tpl

  // You could modify any test-specific configuration object variables here


  insgen_default_seq::type_id::set_type_override(insgen_prand_inorder_ins_seq::get_type());

  m_env = top_env::type_id::create("m_env", this);

  // You can insert code here by setting test_append_to_build_phase in file common.tpl

endfunction : build_phase


// Start of inlined include file generated_tb/tb/include/inlines/test_insert_config.sv
function void top_test::start_of_simulation_phase(uvm_phase phase);

	instruction_base_si isi[$];
raw_instruction_si r1 = new();
raw_instruction_si r2 = new();
raw_instruction_si r3 = new();
li_instruction_t liit = asmutils::get_rand_li_pseudo(1);


isi.push_back(liit.l);
isi.push_back(liit.a);

r1.set_raw_bits(32'h001120A3); // rx[1] => ram[rx[2] + 1]
r2.set_raw_bits(32'h00112123); // rx[1] => ram[rx[2] + 2]
r3.set_raw_bits(32'h001121A3); // rx[1] => ram[rx[2] + 3]

isi.push_back(r1);
isi.push_back(r2);
isi.push_back(r3);

foreach(isi[j])
	m_env.m_insgen_agent.m_config.ic.push_back(isi[j]);

endfunction

// End of inlined include file

`endif // TOP_TEST_SV

