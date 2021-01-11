// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_test_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Mon Jan 11 16:56:56 2021
//=============================================================================
// Description: Test package for top
//=============================================================================

`ifndef TOP_TEST_PKG_SV
`define TOP_TEST_PKG_SV

package top_test_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import verif_pkg::*;
  import insgen_pkg::*;
  import memw_pkg::*;
  import top_pkg::*;

  `include "top_test.sv"

endpackage : top_test_pkg

`endif // TOP_TEST_PKG_SV

