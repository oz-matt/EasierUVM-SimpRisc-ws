// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_tb.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Jul 27 03:28:28 2020
//=============================================================================
// Description: Testbench
//=============================================================================

module top_tb;

  timeunit      1ns;
  timeprecision 1ps;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import verif_pkg::*;
  import top_test_pkg::*;
  import top_pkg::top_config;

  // Configuration object for top-level environment
  top_config top_env_config;

  // Test harness
  top_th th();

  // You can insert code here by setting tb_inc_inside_module in file common.tpl

  // You can remove the initial block below by setting tb_generate_run_test = no in file common.tpl

  initial
  begin
    // Start of inlined include file generated_tb/tb/include/inlines/tb_incs.sv
    $dumpfile("dump.vcd");
    $dumpvars;    // End of inlined include file

    // Create and populate top-level configuration object
    top_env_config = new("top_env_config");
    if ( !top_env_config.randomize() )
      `uvm_error("top_tb", "Failed to randomize top-level configuration object" )

    top_env_config.m_insgen_config.vif = th.insgen_if_0;
    top_env_config.m_memw_config.vif   = th.memw_if_0;  

    uvm_config_db #(top_config)::set(null, "uvm_test_top", "config", top_env_config);
    uvm_config_db #(top_config)::set(null, "uvm_test_top.m_env", "config", top_env_config);

    // You can insert code here by setting tb_inc_before_run_test in file common.tpl

    run_test();
  end

endmodule

