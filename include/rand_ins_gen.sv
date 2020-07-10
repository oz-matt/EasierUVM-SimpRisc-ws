
class rand_ins_gen extends uvm_component;
	
	uvm_seq_item_pull_imp#(instruction_base_si) pull_port;
	insgen_test_config tconfig;
	
	extern function new(string name, uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task get(output instruction_base_si ibsi);
	
endclass
	
	function rand_ins_gen::new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void rand_ins_gen::build_phase(uvm_phase phase);
		if(!uvm_config_db#(insgen_test_config)::get(this, "", "tconfig", tconfig)) 
			`uvm_fatal("DB", "Could not get tconfig");
	endfunction
	
	task rand_ins_gen::get(output instruction_base_si ibsi);
		ibsi = asmutils::get_rand_instruction(tconfig.allowed_instr_types);
	endtask
	