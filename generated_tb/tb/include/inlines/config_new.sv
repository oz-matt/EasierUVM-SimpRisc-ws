
	function insgen_config::init_params(boolean init_rx, instr_category_bm icbm);
		this.init_cpu_regs_with_rand_vals = init_rx;
		this.allowed_instr_types = icbm;
	endfunction
