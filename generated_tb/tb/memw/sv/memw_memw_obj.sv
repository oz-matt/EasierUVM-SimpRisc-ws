// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug  4 08:45:22 2020
//=============================================================================
// Description: Sequence item for memw_sequencer
//=============================================================================

`ifndef MEMW_SEQ_ITEM_SV
`define MEMW_SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file memw.tpl

class memw_obj extends uvm_sequence_item; 

  `uvm_object_utils(memw_obj)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file memw.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file memw.tpl

  // Transaction variables
  logic[31:0] out_data_bus;
  logic[31:0] out_addr_bus;
  logic[31:0] out_data_bus_port2;
  logic[31:0] out_addr_bus_port2;
  logic[31:0] in_data_bus;
  logic mem_rw;
  logic memclk;
  logic[3:0] mem_wstrobe;


  extern function new(string name = "");

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file memw.tpl
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // You can insert code here by setting trans_inc_inside_class in file memw.tpl

endclass : memw_obj 


function memw_obj::new(string name = "");
  super.new(name);
endfunction : new


// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file memw.tpl

function void memw_obj::do_copy(uvm_object rhs);
  memw_obj rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  out_data_bus       = rhs_.out_data_bus;      
  out_addr_bus       = rhs_.out_addr_bus;      
  out_data_bus_port2 = rhs_.out_data_bus_port2;
  out_addr_bus_port2 = rhs_.out_addr_bus_port2;
  in_data_bus        = rhs_.in_data_bus;       
  mem_rw             = rhs_.mem_rw;            
  memclk             = rhs_.memclk;            
  mem_wstrobe        = rhs_.mem_wstrobe;       
endfunction : do_copy


function bit memw_obj::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
  memw_obj rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  result &= comparer.compare_field("out_data_bus", out_data_bus,             rhs_.out_data_bus,       $bits(out_data_bus));
  result &= comparer.compare_field("out_addr_bus", out_addr_bus,             rhs_.out_addr_bus,       $bits(out_addr_bus));
  result &= comparer.compare_field("out_data_bus_port2", out_data_bus_port2, rhs_.out_data_bus_port2, $bits(out_data_bus_port2));
  result &= comparer.compare_field("out_addr_bus_port2", out_addr_bus_port2, rhs_.out_addr_bus_port2, $bits(out_addr_bus_port2));
  result &= comparer.compare_field("in_data_bus", in_data_bus,               rhs_.in_data_bus,        $bits(in_data_bus));
  result &= comparer.compare_field("mem_rw", mem_rw,                         rhs_.mem_rw,             $bits(mem_rw));
  result &= comparer.compare_field("memclk", memclk,                         rhs_.memclk,             $bits(memclk));
  result &= comparer.compare_field("mem_wstrobe", mem_wstrobe,               rhs_.mem_wstrobe,        $bits(mem_wstrobe));
  return result;
endfunction : do_compare


function void memw_obj::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void memw_obj::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
  `uvm_record_field("out_data_bus",       out_data_bus)      
  `uvm_record_field("out_addr_bus",       out_addr_bus)      
  `uvm_record_field("out_data_bus_port2", out_data_bus_port2)
  `uvm_record_field("out_addr_bus_port2", out_addr_bus_port2)
  `uvm_record_field("in_data_bus",        in_data_bus)       
  `uvm_record_field("mem_rw",             mem_rw)            
  `uvm_record_field("memclk",             memclk)            
  `uvm_record_field("mem_wstrobe",        mem_wstrobe)       
endfunction : do_record


function void memw_obj::do_pack(uvm_packer packer);
  super.do_pack(packer);
  `uvm_pack_int(out_data_bus)       
  `uvm_pack_int(out_addr_bus)       
  `uvm_pack_int(out_data_bus_port2) 
  `uvm_pack_int(out_addr_bus_port2) 
  `uvm_pack_int(in_data_bus)        
  `uvm_pack_int(mem_rw)             
  `uvm_pack_int(memclk)             
  `uvm_pack_int(mem_wstrobe)        
endfunction : do_pack


function void memw_obj::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
  `uvm_unpack_int(out_data_bus)       
  `uvm_unpack_int(out_addr_bus)       
  `uvm_unpack_int(out_data_bus_port2) 
  `uvm_unpack_int(out_addr_bus_port2) 
  `uvm_unpack_int(in_data_bus)        
  `uvm_unpack_int(mem_rw)             
  `uvm_unpack_int(memclk)             
  `uvm_unpack_int(mem_wstrobe)        
endfunction : do_unpack


function string memw_obj::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
    "out_data_bus       = 'h%0h  'd%0d\n", 
    "out_addr_bus       = 'h%0h  'd%0d\n", 
    "out_data_bus_port2 = 'h%0h  'd%0d\n", 
    "out_addr_bus_port2 = 'h%0h  'd%0d\n", 
    "in_data_bus        = 'h%0h  'd%0d\n", 
    "mem_rw             = 'h%0h  'd%0d\n", 
    "memclk             = 'h%0h  'd%0d\n", 
    "mem_wstrobe        = 'h%0h  'd%0d\n"},
    get_full_name(), out_data_bus, out_data_bus, out_addr_bus, out_addr_bus, out_data_bus_port2, out_data_bus_port2, out_addr_bus_port2, out_addr_bus_port2, in_data_bus, in_data_bus, mem_rw, mem_rw, memclk, memclk, mem_wstrobe, mem_wstrobe);
  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file memw.tpl

`endif // MEMW_SEQ_ITEM_SV

