
class fill_rxs_seq extends uvm_sequence #(trans_rand_ins);

	`uvm_object_utils(fill_rxs_seq)

	insgen_config  m_config;

	extern function new(string name = "");
	extern virtual task pre_start();
	extern virtual function void mid_do(uvm_sequence_item this_item);
	extern task body();

endclass

function fill_rxs_seq::new(string name = "");
	super.new(name);
endfunction : new


task fill_rxs_seq::pre_start();
	//instr_category_bm ibm = instr_category_bm'(STORE | LOAD);
	//m_config.init_params(false, ibm);
//uvm_config_db#(insgen_config)::set(null, "uvm_test_top.m_env.m_insgen_agent.*", "m_config", m_config);
endtask : pre_start

function void fill_rxs_seq::mid_do(uvm_sequence_item this_item);
	trans_rand_ins pkt;
		li_instruction_t li_obj;

		li_obj = asmutils::get_rand_li_pseudo(m_config.init_cpu_regs_ctr);
	$cast(pkt, this_item);
	//if (m_config.init_cpu_regs_ctr < 32) begin

		// For each of the 32 cpu registers, generate and insert a random value
		// using LUI and ADDI instruction pairs


		if (m_config.on_reg_init_lui == true) begin
			pkt.ibsi = li_obj.l;
			m_config.on_reg_init_lui = false;
		end
		else begin
			pkt.ibsi = li_obj.a;
			m_config.on_reg_init_lui = true;
			//m_config.init_cpu_regs_ctr++;
		end
	//end
endfunction : mid_do

task fill_rxs_seq::body();
	`uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

	req = trans_rand_ins::type_id::create("req");
	start_item(req);
	if ( !req.randomize() )
		`uvm_error(get_type_name(), "Failed to randomize transaction")
	finish_item(req);

	`uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body
