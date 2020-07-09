
package verif_pkg;

	`include "uvm_macros.svh"
	import uvm_pkg::*;
	//`include "defines.sv"
	//`include "insgen_test_config.sv"

class insgen_test_config;
	
	int init_cpu_regs_with_rand_vals;
	
	function new();
		init_cpu_regs_with_rand_vals = 1;
	endfunction
	
endclass

endpackage : verif_pkg
