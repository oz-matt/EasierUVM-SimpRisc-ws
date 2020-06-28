// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-04-18-EP on Sat Jun 27 20:01:44 2020
//=============================================================================
// Description: Sequence for agent insgen
//=============================================================================

`ifndef INSGEN_SEQ_LIB_SV
`define INSGEN_SEQ_LIB_SV

class insgen_default_seq extends uvm_sequence #(trans);

  `uvm_object_utils(insgen_default_seq)

  extern function new(string name = "");
  extern task body();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

endclass : insgen_default_seq


function insgen_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task insgen_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

  req = trans::type_id::create("req");
  start_item(req); 
  if ( !req.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize transaction")
  finish_item(req); 

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


`ifndef UVM_POST_VERSION_1_1
function uvm_phase insgen_default_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void insgen_default_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// You can insert code here by setting agent_seq_inc in file insgen.tpl

`endif // INSGEN_SEQ_LIB_SV

