
instruction_base_si isi[$];

li_instruction_t liit = get_rand_li_pseudo(1);

isi.push_back(liit.l);
isi.push_back(liit.a);

raw_instruction_si r1 = new();
r1.set_raw_bits(32'h001120A3);

isi.push_back(r1);

foreach(isi[j])
	m_env.m_insgen_agent.m_config.ic.push_ins(isi[j]);
