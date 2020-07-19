function void top_test::start_of_simulation_phase(uvm_phase phase);
	
<<<<<<< HEAD
	insgen_default_seq::type_id::set_type_override(insgen_prand_ins_seq::get_type());
=======
	insgen_seq_lib::type_id::set_type_override(insgen_prand_ins_seq::get_type());
>>>>>>> aef10d1f477d5da729c8942f92f15f1696d0e4b9
	
endfunction