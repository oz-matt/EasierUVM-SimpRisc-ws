function void reference::write_reference_0(trans_rand_ins t);
	// this trans_rand_ins object comes from the insgen monitor  
	memw_obj m;
	insgen_pkt_t s;
	cpu_output_t c;
	
	s.instruction = t.rand_instruction;
	s.name = 1;
	
	get_reference_output(s); // calls cpu_resolve when finished
	
	if(!uvm_config_db#(cpu_output_t)::get(null, "", "cpu_output", c))
		`uvm_fatal("REF", "Failed to get reference output");
	
	m = memw_obj::type_id::create("m");
	m.out_data_bus = c.out_data_bus;
	m.out_addr_bus = c.out_addr_bus;
	m.in_data_bus = c.in_data_bus;
	m.mem_rw = c.memrw;
	m.mem_wstrobe = c.wstrobe;
	
	/*`uvm_info(get_type_name(), $sformatf({"\r\n\r\nout_data_bus: %X \r\n",
			"out_addr_bus: %X  \r\n",
			"in_data_bus: %X  \r\n",
			"mem_rw: %X  \r\n",
		"mem_wstrobe: %X \r\n\r\n"}, 
		m.out_data_bus, 
		m.out_addr_bus,
		m.in_data_bus, 
		m.mem_rw, 
		m.mem_wstrobe), UVM_MEDIUM)*/
	
	analysis_port_0.write(m);
	
endfunction

function void cpu_resolve(cpu_output_t t);
	`uvm_info("T", $sformatf({"\r\n\r\nout_data_bus: %X \r\n",
			"out_addr_bus: %X  \r\n",
			"in_data_bus: %X  \r\n",
			"mem_rw: %X  \r\n",
		"mem_wstrobe: %X \r\n\r\n"}, 
		t.out_data_bus, 
		t.out_addr_bus,
		t.in_data_bus, 
		t.memrw, 
		t.wstrobe), UVM_MEDIUM)
	uvm_config_db#(cpu_output_t)::set(null, "*", "cpu_output", t);
endfunction