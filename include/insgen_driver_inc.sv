task insgen_driver::do_drive();
	vif.data_bus <= req.rand_instruction;
	#10;
endtask