#!/bin/sh
cd ../generated_tb/sim;
rm -rf csrc/ simv.vdb/ simv.daidir/ simv;
vcs -sverilog -lca -debug_access+all -assert enable_diag \
		+define+ASSERT_ON -y $VCS_HOME/packages/sva +libext+.v \
		+incdir+$VCS_HOME/packages/sva -P /home/disk/Verdi3_L-2016.06-1/share/PLI/VCS/LINUX64/novas.tab \
								/home/disk/Verdi3_L-2016.06-1/share/PLI/VCS/LINUX64/pli.a -full64 +libext+.v+.h+.vh+.vlib \
		-kdb +vcs+vcdpluson -l comp.log -timescale=1ns/1ps -ntb_opts uvm-1.2 \
+incdir+../tb/include \
+incdir+../tb/insgen/sv \
+incdir+../tb/memw/sv \
+incdir+../../uvm_syoscb/src \
+incdir+../tb/top/sv \
+incdir+../tb/top_test/sv \
+incdir+../tb/top_tb/sv \
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
-R +UVM_TESTNAME=top_test $* 
