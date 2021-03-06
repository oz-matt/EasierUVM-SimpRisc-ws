#!/bin/sh
cd ../generated_tb/sim;
rm -rf csrc/ simv.vdb/ simv.daidir/ simv;
vcs -ams +ad -ams_discipline logic +systemverilogext+.sv -sverilog -cm line+cond+fsm -full64 -covg_dump_range +acc +vpi +error+20 -l comp.log -timescale=1ns/1ps -adopt absdelta -ntb_opts uvm-1.1 \
+incdir+../tb/include \
+incdir+../tb/insgen/sv \
+incdir+../tb/memw/sv \
+incdir+../../uvm_syoscb/src \
+incdir+../tb/top/sv \
+incdir+../tb/top_test/sv \
+incdir+../tb/top_tb/sv \
+incdir+../ref_model_cpp/ \
+incdir+../ref_model_cpp/ins/ \
-F ../dut/files.f \
-F ../dut/ams_src/files.f \
-F ../dut/ams_src/ams-models/files.f \
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
../tb/include/ref_model_cpp/cref.cpp \
../tb/include/ref_model_cpp/ipkt.cpp \
../tb/include/ref_model_cpp/iexec.cpp \
../tb/include/ref_model_cpp/ins/ibase.cpp \
../tb/include/ref_model_cpp/ins/arithins.cpp \
../tb/include/ref_model_cpp/ins/loadins.cpp \
../tb/include/ref_model_cpp/ins/storeins.cpp \
-R +UVM_TESTNAME=test_rand_ins $* 
