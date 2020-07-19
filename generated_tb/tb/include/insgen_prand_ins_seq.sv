
`ifndef INSGEN_PRAND_INS_SEQ_SV
`define INSGEN_PRAND_INS_SEQ_SV

class insgen_prand_ins_seq extends insgen_default_seq;

	`uvm_object_utils(insgen_prand_ins_seq)

	extern function void pre_do(uvm_sequence_item this_item);
	extern function void mid_do(uvm_sequence_item this_item); 

endclass

function void insgen_prand_ins_seq::pre_do(uvm_sequence_item this_item);
	instr_category_bm ibm = instr_category_bm'(LOAD | STORE | ARITHMETIC);
	this.m_config = new(true, ibm);
	uvm_config_db#(insgen_test_config)::set(null, "uvm_test_top.m_env.m_insgen_agent.*", "m_config", m_config);
endfunction : pre_do

function void insgen_prand_ins_seq::mid_do(uvm_sequence_item this_item);
	trans pkt;
	$cast(pkt, this_item);
	instruction_base_si ibsi;
	ibsi = asmutils::get_rand_instruction(m_config.allowed_instr_types);
	pkt.rand_instruction = ibsi.get_raw_bits;
endfunction : mid_do

`endif // INSGEN_PRAND_INS_SEQ_SV


