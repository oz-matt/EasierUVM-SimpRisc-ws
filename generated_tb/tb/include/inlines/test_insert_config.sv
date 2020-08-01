function void top_test::start_of_simulation_phase(uvm_phase phase);

	instruction_base_si isi[$];
raw_instruction_si r1 = new();
li_instruction_t liit = asmutils::get_rand_li_pseudo(1);


isi.push_back(liit.l);
isi.push_back(liit.a);

r1.set_raw_bits(32'h001120A3);

isi.push_back(r1);

foreach(isi[j])
	m_env.m_insgen_agent.m_config.ic.push_back(isi[j]);

endfunction

