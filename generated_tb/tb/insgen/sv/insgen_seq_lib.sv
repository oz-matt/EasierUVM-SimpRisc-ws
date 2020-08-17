// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug 18 07:39:50 2020
//=============================================================================
// Description: Sequence for agent insgen
//=============================================================================

`ifndef INSGEN_SEQ_LIB_SV
`define INSGEN_SEQ_LIB_SV

class insgen_default_seq extends uvm_sequence #(trans_rand_ins);

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

  req = trans_rand_ins::type_id::create("req");
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

	extern function new(string name = "");
	extern virtual task pre_start();
	extern virtual function void mid_do(uvm_sequence_item this_item);
	extern task body();

endclass


function insgen_prand_ins_seq::new(string name = "");
	super.new(name);
endfunction : new


task insgen_prand_ins_seq::pre_start();
	instr_category_bm ibm = instr_category_bm'(STORE | LOAD);
	m_config.init_params(false, ibm);
//uvm_config_db#(insgen_config)::set(null, "uvm_test_top.m_env.m_insgen_agent.*", "m_config", m_config);
endtask : pre_start

function void insgen_prand_ins_seq::mid_do(uvm_sequence_item this_item);
	trans_rand_ins pkt;
	$cast(pkt, this_item);
	if ((m_config.init_cpu_regs_ctr < 32) && (m_config.init_cpu_regs_with_rand_vals == true)) begin

		// For each of the 32 cpu registers, generate and insert a random value
		// using LUI and ADDI instruction pairs

		li_instruction_t li_obj;

		li_obj = asmutils::get_rand_li_pseudo(m_config.init_cpu_regs_ctr);

		if (m_config.on_reg_init_lui == true) begin
			pkt.ibsi = li_obj.l;
			m_config.on_reg_init_lui = false;
		end
		else begin
			pkt.ibsi = li_obj.a;
			m_config.on_reg_init_lui = true;
			m_config.init_cpu_regs_ctr++;
		end
	end
	else begin
		`uvm_info("T", "RandIns", UVM_MEDIUM);
		pkt.ibsi = asmutils::get_rand_instruction(m_config.allowed_instr_types);
	end
endfunction : mid_do

task insgen_prand_ins_seq::body();
	`uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

	req = trans_rand_ins::type_id::create("req");
	start_item(req);
	if ( !req.randomize() )
		`uvm_error(get_type_name(), "Failed to randomize transaction")
	finish_item(req);

	`uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body

class insgen_prand_inorder_ins_seq extends insgen_prand_ins_seq;

	`uvm_object_utils(insgen_prand_inorder_ins_seq)

	extern function new(string name = "");
	extern virtual function void mid_do(uvm_sequence_item this_item);

endclass

function insgen_prand_inorder_ins_seq::new(string name = "");
	super.new(name);
endfunction : new

function void insgen_prand_inorder_ins_seq::mid_do(uvm_sequence_item this_item);
	trans_rand_ins pkt;
	$cast(pkt, this_item);
	if(m_config.ic.size() > 0) pkt.ibsi = m_config.ic.pop_front();
	else pkt.ibsi = new();
endfunction : mid_do

// End of inlined include file

`endif // INSGEN_SEQ_LIB_SV

