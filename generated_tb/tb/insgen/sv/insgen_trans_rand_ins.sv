// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Sun Jan 10 00:41:38 2021
//=============================================================================
// Description: Sequence item for insgen_sequencer
//=============================================================================

`ifndef INSGEN_SEQ_ITEM_SV
`define INSGEN_SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file insgen.tpl

class trans_rand_ins extends uvm_sequence_item; 

  `uvm_object_utils(trans_rand_ins)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file insgen.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file insgen.tpl

  // Transaction variables
  rand logic[31:0] rand_instruction;
  rand logic[31:0] adc_data;
  instruction_base_si ibsi;


  extern function new(string name = "");

  // You can insert code here by setting trans_inc_inside_class in file insgen.tpl

endclass : trans_rand_ins 


function trans_rand_ins::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting trans_inc_after_class in file insgen.tpl

`endif // INSGEN_SEQ_ITEM_SV

