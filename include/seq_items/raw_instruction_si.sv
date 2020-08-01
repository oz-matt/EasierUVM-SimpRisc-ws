
class raw_instruction_si extends instruction_base_si;
	`uvm_object_utils(raw_instruction_si)
	
	bit[31:0] raw_bits;
	
	function new(string inst_name = "raw_instruction_si");
		super.new(inst_name);
	endfunction

	virtual function bit[31:0] get_raw_bits();
		return raw_bits;
	endfunction
	
	function bit[31:0] set_raw_bits(bit[31:0] raw);
		raw_bits = raw;
	endfunction

	virtual function string get_asm_string();
		return "RAW UNIMP";
	endfunction
	
endclass

