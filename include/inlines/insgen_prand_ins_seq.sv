
class insgen_prand_ins_seq extends insgen_default_seq;

	`uvm_object_utils(insgen_prand_ins_seq)
	
	extern function new(string name = "");
	extern task pre_start();
	extern function void mid_do(uvm_sequence_item this_item); 
	extern task body();

endclass


function insgen_prand_ins_seq::new(string name = "");
	super.new(name);
endfunction : new


task insgen_prand_ins_seq::pre_start();
	instr_category_bm ibm = instr_category_bm'(LOAD | STORE | ARITHMETIC);
	m_config.init_params(true, ibm);
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
		pkt.ibsi = asmutils::get_rand_instruction(m_config.allowed_instr_types);
	end
endfunction : mid_do

task insgen_prand_ins_seq::body();
	`uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

	req = trans_rand_ins::type_id::create("req");
	start_item(req); 
	if ( !req.randomize() )
		`uvm_error(get_type_name(), "Failed to randomize transaction")
	/*if(m_config.init_cpu_regs_with_rand_vals == false) 
		req.rand_instruction = 8;
	else
		req.rand_instruction = 3;*/
	
	finish_item(req); 

	`uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body

