task insgen_driver::do_drive();
	vif.data_bus <= req.rand_instruction;
	vif.adc_in <= req.adc_data;
	#10;
endtask
