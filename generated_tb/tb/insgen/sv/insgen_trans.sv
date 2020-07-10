// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 10 22:44:56 2020
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


  extern function new(string name = "");

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file insgen.tpl
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // Start of inlined include file generated_tb/tb/include/ins_constraints.sv
  
  constraint ins_c {
  	rand_instruction inside {32'h0040A003, 32'h00110113};
  	adc_data dist {0:=20, 1:=20, [2:128]:/50, [129:(2**32)-1]:/50};
  };
  // End of inlined include file

endclass : trans 


function trans::new(string name = "");
  super.new(name);
endfunction : new


// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file insgen.tpl

function void trans::do_copy(uvm_object rhs);
  trans rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  rand_instruction = rhs_.rand_instruction;
  adc_data         = rhs_.adc_data;        
endfunction : do_copy


function bit trans::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
  trans rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  result &= comparer.compare_field("rand_instruction", rand_instruction, rhs_.rand_instruction, $bits(rand_instruction));
  result &= comparer.compare_field("adc_data", adc_data,                 rhs_.adc_data,         $bits(adc_data));
  return result;
endfunction : do_compare


function void trans::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void trans::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
  `uvm_record_field("rand_instruction", rand_instruction)
  `uvm_record_field("adc_data",         adc_data)        
endfunction : do_record


function void trans::do_pack(uvm_packer packer);
  super.do_pack(packer);
  `uvm_pack_int(rand_instruction) 
  `uvm_pack_int(adc_data)         
endfunction : do_pack


function void trans::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
  `uvm_unpack_int(rand_instruction) 
  `uvm_unpack_int(adc_data)         
endfunction : do_unpack


function string trans::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
    "rand_instruction = 'h%0h  'd%0d\n", 
    "adc_data         = 'h%0h  'd%0d\n"},
    get_full_name(), rand_instruction, rand_instruction, adc_data, adc_data);
  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file insgen.tpl

`endif // INSGEN_SEQ_ITEM_SV

