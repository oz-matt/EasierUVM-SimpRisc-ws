function void reference::write_reference_0(trans_rand_ins t);
	memw_obj m;
	insgen_pkt_t s;
	cpu_output_t c;
	int n;
	
	m= memw_obj::type_id::create("m");
	m.out_data_bus = t.rand_instruction;
	n = t.rand_instruction;
	
	s.instruction = 5;
	s.name = 1;
	analysis_port_0.write(m);
	
	get_reference_output(s); // calls cpu_resolve when finished
	
	if(!uvm_config_db#(cpu_output_t)::get(null, "", "cpu_output", c))
		`uvm_fatal("REF", "Failed to get reference output");
	
	
endfunction

function void cpu_resolve(cpu_output_t t);
	uvm_config_db#(cpu_output_t)::set(null, "*", "cpu_output", t);
endfunction