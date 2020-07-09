// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: _seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 10 01:43:41 2020
//=============================================================================
// Description: Sequence item for _sequencer
//=============================================================================

`ifndef _SEQ_ITEM_SV
`define _SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file 

class  extends uvm_sequence_item; 

  `uvm_object_utils()

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file 
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file 



  extern function new(string name = "");

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file 
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // You can insert code here by setting trans_inc_inside_class in file 

endclass :  


function ::new(string name = "");
  super.new(name);
endfunction : new


// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file 

function void ::do_copy(uvm_object rhs);
   rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
endfunction : do_copy


function bit ::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
   rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  return result;
endfunction : do_compare


function void ::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void ::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
endfunction : do_record


function void ::do_pack(uvm_packer packer);
  super.do_pack(packer);
endfunction : do_pack


function void ::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
endfunction : do_unpack


function string ::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());

  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file 

`endif // _SEQ_ITEM_SV

