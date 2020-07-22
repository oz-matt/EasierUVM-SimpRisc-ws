
package verif_pkg;

	`include "uvm_macros.svh"
	import uvm_pkg::*;
	`include "defines.sv"
	
	`include "seq_items/instruction_base_si.sv"
	`include "seq_items/arithmetic_instruction_si.sv"
	`include "seq_items/store_instruction_si.sv"
	`include "seq_items/load_instruction_si.sv"
	`include "pseudo.sv"
	`include "seq_items/asmutils.sv"
	
	
	`include "rand_ins_gen.sv"

	
endpackage : verif_pkg
