if(!uvm_config_db#(instruction_base_si[$])::get(this, "", "directs", isi))
	`uvm_fatal("FAT", "Could net get insgen directs");

foreach(isi[j])
	m_config.ic.push_back(isi[j]);