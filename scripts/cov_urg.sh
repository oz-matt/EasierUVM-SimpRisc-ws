#!/bin/sh
cd ../generated_tb/sim;
/home/work/synopsys/L-2016.06/bin/urg -group show_bin_values -dir simv.vdb;
firefox urgReport/dashboard.html 
