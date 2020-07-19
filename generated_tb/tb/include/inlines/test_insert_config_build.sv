instr_category_bm ibm = instr_category_bm'(LOAD | STORE | ARITHMETIC);

tconfig = new(true, ibm);

uvm_config_db#(insgen_config)::set(this, "m_env.m_insgen_agent.*", "tconfig", tconfig);
