task insgen_monitor::do_mon;
	/*wait(vif.nreset);
	forever  @(posedge vif.clk) begin
		#1;
		m_trans.rand_instruction = vif.instr_bus;
		m_trans.adc_data = vif.adc_in;
		analysis_port.write(m_trans);
		`uvm_info(get_type_name(), $sformatf("ins: %X, adc: %X", vif.instr_bus, vif.adc_in), UVM_MEDIUM);
	end*/
endtask
