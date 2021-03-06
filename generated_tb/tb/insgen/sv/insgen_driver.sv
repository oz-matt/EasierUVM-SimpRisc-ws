// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jan 15 04:37:23 2021
//=============================================================================
// Description: Driver for insgen
//=============================================================================

`ifndef INSGEN_DRIVER_SV
`define INSGEN_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file insgen.tpl

class insgen_driver extends uvm_driver #(trans_rand_ins);

  `uvm_component_utils(insgen_driver)

  virtual insgen_if vif;

  insgen_config     m_config;

  extern function new(string name, uvm_component parent);

  // Methods run_phase and do_drive generated by setting driver_inc in file insgen.tpl
  extern task run_phase(uvm_phase phase);
  extern task do_drive();

  // You can insert code here by setting driver_inc_inside_class in file insgen.tpl

endclass : insgen_driver 


function insgen_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


task insgen_driver::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "run_phase", UVM_HIGH)

  forever
  begin
    seq_item_port.get_next_item(req);
      `uvm_info(get_type_name(), {"req item\n",req.sprint}, UVM_HIGH)
    do_drive();
    seq_item_port.item_done();
  end
endtask : run_phase


// Start of inlined include file generated_tb/tb/include/inlines/insgen_driver_inc.sv
task insgen_driver::do_drive();
  wait (vif.nreset);
  @(posedge vif.clk);
  if(vif.nreset) begin
    vif.instr_bus <= req.ibsi.get_raw_bits();
    `uvm_info(get_type_name(), $sformatf("instr: %X , %s", req.ibsi.get_raw_bits(), req.ibsi.get_asm_string()), UVM_HIGH);
    vif.adc_in <= req.adc_data;
  end
endtask
// End of inlined include file

// You can insert code here by setting driver_inc_after_class in file insgen.tpl

`endif // INSGEN_DRIVER_SV

