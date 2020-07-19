
if (get_is_active() == UVM_ACTIVE)
	begin
		m_driver.pull_port.connect(rig.pull_imp);
	end