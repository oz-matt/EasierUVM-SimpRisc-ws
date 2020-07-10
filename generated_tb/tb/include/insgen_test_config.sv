
class insgen_test_config extends uvm_object;
	
	boolean init_cpu_regs_with_rand_vals;
	instr_category_bm allowed_instr_types;
	
	function new(boolean init_rx, instr_category_bm icbm);
		init_cpu_regs_with_rand_vals = init_rx;
		allowed_instr_types = icbm;
	endfunction
	
endclass
