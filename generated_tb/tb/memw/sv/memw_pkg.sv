// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jan 15 04:37:23 2021
//=============================================================================
// Description: Package for agent memw
//=============================================================================

package memw_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import verif_pkg::*;

  `include "memw_memw_obj.sv"
  `include "memw_config.sv"
  `include "memw_driver.sv"
  `include "memw_monitor.sv"
  `include "memw_sequencer.sv"
  `include "memw_coverage.sv"
  `include "memw_agent.sv"
  `include "memw_seq_lib.sv"

endpackage : memw_pkg
