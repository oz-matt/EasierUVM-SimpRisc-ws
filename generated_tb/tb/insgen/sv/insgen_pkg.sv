// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Nov  9 03:41:30 2020
//=============================================================================
// Description: Package for agent insgen
//=============================================================================

package insgen_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import verif_pkg::*;

  `include "insgen_trans_rand_ins.sv"
  `include "insgen_config.sv"
  `include "insgen_driver.sv"
  `include "insgen_monitor.sv"
  `include "insgen_sequencer.sv"
  `include "insgen_coverage.sv"
  `include "insgen_agent.sv"
  `include "insgen_seq_lib.sv"

endpackage : insgen_pkg
