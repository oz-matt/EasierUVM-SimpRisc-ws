task insgen_driver::do_drive();
	vif.instr_bus <= req.rand_instruction;//req.ibsi.get_raw_bits();
	vif.adc_in <= req.adc_data;
	#10;
endtask
