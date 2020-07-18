function void top_test::start_of_simulation_phase(uvm_phase phase);
	
	insgen_seq_lib::type_id::set_type_override(insgen_prand_ins_seq::get_type());
	
endfunction