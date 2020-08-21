
class test_rand_ins extends top_test;
	`uvm_component_utils(test_rand_ins)
	//top_env m_env;
	extern function new(string name, uvm_component parent);
	extern function void build_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);  // End of inlined include file
	
endclass


function test_rand_ins::new(string name, uvm_component parent);
	super.new(name, parent);
endfunction : new

function void test_rand_ins::build_phase(uvm_phase phase);
	super.build_phase(phase);
	insgen_default_seq::type_id::set_type_override(insgen_prand_ins_seq::get_type());
endfunction : build_phase
	
function void test_rand_ins::start_of_simulation_phase(uvm_phase phase);
	instr_category_bm ibm = instr_category_bm'(STORE | LOAD);
	m_env.m_insgen_agent.m_config.init_params(true, ibm);
endfunction

