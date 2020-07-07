class insgen_test_config extends uvm_object;
	
	boolean init_cpu_regs_with_rand_vals;
	
	function new(boolean init_regs);
		init_cpu_regs_with_rand_vals = init_regs;
	endfunction
	
endclass
