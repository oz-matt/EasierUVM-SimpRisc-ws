#!/bin/sh
vcs -sverilog +acc +vpi -timescale=1ns/1ps -ntb_opts uvm-1.2 \
+incdir+../tb/include \
+incdir+../tb/insgen/sv \
+incdir+../tb/memw/sv \
+incdir+../tb/top/sv \
+incdir+../tb/top_test/sv \
+incdir+../tb/top_tb/sv \
-F ../dut/files.f \
../tb/include//pkg/verif_pkg.sv \
../tb/insgen/sv/insgen_pkg.sv \
../tb/insgen/sv/insgen_if.sv \
../tb/memw/sv/memw_pkg.sv \
../tb/memw/sv/memw_if.sv \
../tb/top/sv/top_pkg.sv \
../tb/top_test/sv/top_test_pkg.sv \
../tb/top_tb/sv/top_th.sv \
../tb/top_tb/sv/top_tb.sv \
-R +UVM_TESTNAME=top_test  $* 
