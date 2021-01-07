#!/bin/sh
cd ../generated_tb/sim;
verdi -f verdi_files.f -sv -ba -ssf novas.fsdb
