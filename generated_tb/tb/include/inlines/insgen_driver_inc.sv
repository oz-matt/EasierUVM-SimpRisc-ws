task insgen_driver::do_drive();
	wait (vif.nreset);
	@(posedge vif.clk)
	if(vif.nreset) begin
		vif.instr_bus <= req.ibsi.get_raw_bits();
		`uvm_info(get_type_name(), $sformatf("instr: %s", req.ibsi.get_asm_string()), UVM_LOW);
		vif.adc_in <= req.adc_data;
	end
endtask
