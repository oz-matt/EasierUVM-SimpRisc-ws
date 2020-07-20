
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


