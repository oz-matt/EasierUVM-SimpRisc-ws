#!/bin/sh
vcs -cm line \
-sverilog \
-F ../dut/files_cov.f \
../dut/soc_top.sv
