// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memr_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 23:06:54 2020
//=============================================================================
// Description: Package for agent memr
//=============================================================================

package memr_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import verif_pkg::*;

  `include "memr_memr_obj.sv"
  `include "memr_config.sv"
  `include "memr_driver.sv"
  `include "memr_monitor.sv"
  `include "memr_sequencer.sv"
  `include "memr_coverage.sv"
  `include "memr_agent.sv"
  `include "memr_seq_lib.sv"

endpackage : memr_pkg
