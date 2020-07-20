// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Jul 21 03:15:04 2020
//=============================================================================
// Description: Sequence for agent insgen
//=============================================================================

`ifndef INSGEN_SEQ_LIB_SV
`define INSGEN_SEQ_LIB_SV

class insgen_default_seq extends uvm_sequence #(trans);

  `uvm_object_utils(insgen_default_seq)

  insgen_config  m_config;

  extern function new(string name = "");
  extern task body();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

endclass : insgen_default_seq


function insgen_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task insgen_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

  req = trans::type_id::create("req");
  start_item(req); 
  if ( !req.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize transaction")
  finish_item(req); 

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


`ifndef UVM_POST_VERSION_1_1
function uvm_phase insgen_default_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void insgen_default_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// Start of inlined include file generated_tb/tb/include/inlines/insgen_prand_ins_seq.sv

class insgen_prand_ins_seq extends insgen_default_seq;

	`uvm_object_utils(insgen_prand_ins_seq)

	extern function new(string name);
	extern task pre_start();
	extern function void mid_do(uvm_sequence_item this_item); 

endclass

function insgen_prand_ins_seq::new(string name = "");
	super.new(name);
endfunction : new


task insgen_prand_ins_seq::pre_start();
	instr_category_bm ibm = instr_category_bm'(LOAD | STORE | ARITHMETIC);
	this.m_config.init_params(true, ibm);
	//uvm_config_db#(insgen_config)::set(null, "uvm_test_top.m_env.m_insgen_agent.*", "m_config", m_config);
endtask : pre_start

function void insgen_prand_ins_seq::mid_do(uvm_sequence_item this_item);
	trans pkt;
	$cast(pkt, this_item);
	pkt.ibsi = asmutils::get_rand_instruction(this.m_config.allowed_instr_types);
	pkt.rand_instruction = 9;//pkt.ibsi.get_raw_bits();
endfunction : mid_do


// End of inlined include file

`endif // INSGEN_SEQ_LIB_SV

