// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Jul 21 23:15:30 2020
//=============================================================================
// Description: Sequence item for insgen_sequencer
//=============================================================================

`ifndef INSGEN_SEQ_ITEM_SV
`define INSGEN_SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file insgen.tpl

class trans extends uvm_sequence_item; 

  `uvm_object_utils(trans)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file insgen.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file insgen.tpl

  // Transaction variables
  rand logic[31:0] rand_instruction;
  rand logic[31:0] adc_data;
  instruction_base_si ibsi;


  extern function new(string name = "");

  // Start of inlined include file generated_tb/tb/include/inlines/ins_constraints.sv
  
  constraint ins_c {
  	rand_instruction inside {32'h0040A003, 32'h00110113};
  	adc_data dist {0:=20, 1:=20, [2:128]:/50, [129:(2**32)-1]:/50};
  };
  // End of inlined include file

endclass : trans 


function trans::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting trans_inc_after_class in file insgen.tpl

`endif // INSGEN_SEQ_ITEM_SV

