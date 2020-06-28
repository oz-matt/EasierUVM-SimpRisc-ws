task insgen_monitor::do_mon;
	forever @(vif.data_bus) begin
		m_trans.rand_instruction = vif.data_bus;
		analysis_port.write(m_trans);
		`uvm_info(get_type_name(), $sformatf("ins: %0X", vif.data_bus), UVM_MEDIUM);
	end
endtask