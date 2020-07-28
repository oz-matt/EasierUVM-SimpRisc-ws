#!/bin/sh
cd ../generated_tb/sim;
./simv +ntb_random_seed=1 +UVM_TESTNAME=top_test +UVM_VERBOSITY=UVM_MEDIUM +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE;
verdi -play ../../verdi_scripts/100ns_tr_v_wave.cmd -nologo &