#!/bin/sh
cd ../generated_tb/sim;
rm -rf csrc/ simv.vdb/ simv.daidir/ simv
vcs -cm line \
-sverilog \
-F ../dut/files_cov.f \
../dut/soc_top.sv
