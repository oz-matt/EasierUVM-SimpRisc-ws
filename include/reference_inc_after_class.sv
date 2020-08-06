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
	`uvm_warning("P", $sformatf("In Ref!!: %X", something(s)));
	`uvm_warning("P", $sformatf("In Ref!!: %X", n));
endfunction// End of inlined include file// End of inlined include file
