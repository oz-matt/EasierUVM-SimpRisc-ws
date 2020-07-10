instr_category_bm ibm;
$cast(ibm, LOAD | STORE | ARITHMETIC);

tconfig = new(true, ibm);

uvm_config_db#(insgen_test_config)::set(this, "top_test.m_env", "tconfig", tconfig);
