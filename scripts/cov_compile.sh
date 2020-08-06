#!/bin/sh
cd ../generated_tb/sim;
rm -rf csrc/ simv.vdb/ simv.daidir/ simv;
vcs -sverilog -cm line+cond+fsm -covg_dump_range +acc +vpi +error+20 -l comp.log -timescale=1ns/1ps -ntb_opts uvm-1.2 \
+incdir+../tb/include \
+incdir+../tb/insgen/sv \
+incdir+../tb/memw/sv \
+incdir+../../uvm_syoscb/src \
+incdir+../tb/top/sv \
+incdir+../tb/top_test/sv \
+incdir+../tb/top_tb/sv \
+incdir+../ref_model_cpp/ \
-F ../dut/files.f \
../tb/include/verif_pkg.sv \
../tb/insgen/sv/insgen_pkg.sv \
../tb/insgen/sv/insgen_if.sv \
../tb/memw/sv/memw_pkg.sv \
../tb/memw/sv/memw_if.sv \
../../uvm_syoscb/src/pk_syoscb.sv \
../tb/top/sv/top_pkg.sv \
../tb/top_test/sv/top_test_pkg.sv \
../tb/top_tb/sv/top_th.sv \
../tb/top_tb/sv/top_tb.sv \
../tb/include/ref_model_cpp/ref.cpp \
-R +UVM_TESTNAME=top_test $* 
