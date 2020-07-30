instr_category_bm ibm = instr_category_bm'(STORE);

tconfig = new(false, ibm);

uvm_config_db#(insgen_config)::set(this, "m_env.m_insgen_agent.*", "tconfig", tconfig);
