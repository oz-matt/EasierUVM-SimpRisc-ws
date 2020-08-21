task top_env::run_phase(uvm_phase phase);
	top_default_seq vseq;
	vseq = top_default_seq::type_id::create("vseq");
	vseq.set_item_context(null, null);
	if ( !vseq.randomize() )
		`uvm_fatal(get_type_name(), "Failed to randomize virtual sequence")
	vseq.m_insgen_agent = m_insgen_agent;
	vseq.m_memw_agent   = m_memw_agent;  
	vseq.m_config       = m_config;      
	vseq.set_starting_phase(phase);
	vseq.start(null);

	// You can insert code here by setting top_env_append_to_run_phase in file common.tpl

endtask : run_phase