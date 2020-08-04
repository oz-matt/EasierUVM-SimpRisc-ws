function void reference::write_reference_0(trans_rand_ins t);
	memw_obj m;
	m.out_data_bus = 32'hEEFFEEFF;
	analysis_port_0.write(m);
	`uvm_warning("P", $sformatf("In Ref!!: %s", t.ibsi.get_asm_string()))
endfunction