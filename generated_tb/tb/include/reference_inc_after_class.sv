function void reference::write_reference_0(trans_rand_ins t);
	memw_obj m;
	insgen_pkt_t s;
	int n;
	
	m= memw_obj::type_id::create("m");
	m.out_data_bus = t.rand_instruction;
	n = t.rand_instruction;
	
	s.instruction = 5;
	s.name = 1;
	analysis_port_0.write(m);
	
	somethin(s); // calls cpu_resolve when finished
	
	
	//`uvm_warning("P", $sformatf("In Ref!!: %X, %X, %X", c.out_data_bus, c.out_addr_bus, c.in_data_bus));
	`uvm_warning("P", $sformatf("In Ref!!: %X", n));
endfunction

function void cpu_resolve(cpu_output_t t);
	`uvm_warning("P", $sformatf("disppp:%X, %X, %X", t.out_data_bus, t.out_addr_bus, t.in_data_bus));
endfunction