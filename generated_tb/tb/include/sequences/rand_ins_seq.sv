
class rand_ins_seq extends uvm_sequence #(trans_rand_ins);

	`uvm_object_utils(rand_ins_seq)

	insgen_config  m_config;

	extern function new(string name = "");
	extern virtual task pre_start();
	extern virtual function void mid_do(uvm_sequence_item this_item);
	extern task body();

endclass

function rand_ins_seq::new(string name = "");
	super.new(name);
endfunction : new


task rand_ins_seq::pre_start();
	//instr_category_bm ibm = instr_category_bm'(STORE | LOAD);
	//m_config.init_params(false, ibm);
//uvm_config_db#(insgen_config)::set(null, "uvm_test_top.m_env.m_insgen_agent.*", "m_config", m_config);
endtask : pre_start

function void rand_ins_seq::mid_do(uvm_sequence_item this_item);
	trans_rand_ins pkt;
	$cast(pkt, this_item);
		`uvm_info("T", "RandIns", UVM_MEDIUM);
		pkt.ibsi = asmutils::get_rand_instruction(m_config.allowed_instr_types);
endfunction : mid_do

task rand_ins_seq::body();
	`uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

	req = trans_rand_ins::type_id::create("req");
	start_item(req);
	if ( !req.randomize() )
		`uvm_error(get_type_name(), "Failed to randomize transaction")
	finish_item(req);

	`uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body
