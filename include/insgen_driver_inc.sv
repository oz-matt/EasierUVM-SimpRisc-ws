function void insgen_driver::build_phase (uvm_phase phase);
	super.build_phase (phase);
	pull_port = new("pull_port", this);
endfunction

task insgen_driver::do_drive();
	instruction_base_si rind;
	pull_port.get(rind);
	vif.data_bus <= rind.get_raw_bits();
	vif.adc_in <= req.adc_data;
	#10;
endtask
