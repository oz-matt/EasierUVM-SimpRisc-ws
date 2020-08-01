
class inorder_ins_c extends uvm_object;
	
	instruction_base_si iset[$];
	
	extern function new(instruction_base_si iset[$]);
	extern function void push_ins(instruction_base_si i);
	extern function instruction_base_si pop_ins();
	extern function int get_size();
	
endclass

function inorder_ins_c::new(instruction_base_si iset[$]);
		this.iset = iset;
endfunction : new


function void inorder_ins_c::push_ins(instruction_base_si i);
		this.iset.push_back(i);
endfunction : push_ins

function instruction_base_si inorder_ins_c::pop_ins();
		return iset.pop_front();
endfunction : pop_ins

function int inorder_ins_c::get_size();
		return iset.size();
endfunction : get_size
