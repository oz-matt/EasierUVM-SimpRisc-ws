// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: insgen_monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug 18 23:43:32 2020
//=============================================================================
// Description: Monitor for insgen
//=============================================================================

`ifndef INSGEN_MONITOR_SV
`define INSGEN_MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file insgen.tpl

class insgen_monitor extends uvm_monitor;

  `uvm_component_utils(insgen_monitor)

  virtual insgen_if vif;

  insgen_config     m_config;

  uvm_analysis_port #(trans_rand_ins) analysis_port;

  trans_rand_ins m_trans;

  extern function new(string name, uvm_component parent);

  // Methods run_phase, and do_mon generated by setting monitor_inc in file insgen.tpl
  extern task run_phase(uvm_phase phase);
  extern task do_mon();

  // You can insert code here by setting monitor_inc_inside_class in file insgen.tpl

endclass : insgen_monitor 


function insgen_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


task insgen_monitor::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "run_phase", UVM_HIGH)

  m_trans = trans_rand_ins::type_id::create("m_trans");
  do_mon();
endtask : run_phase


// Start of inlined include file generated_tb/tb/include/inlines/insgen_monitor_inc.sv
task insgen_monitor::do_mon;
	wait(vif.nreset);
	forever  @(posedge vif.clk) begin
		#1;
		m_trans.rand_instruction = vif.instr_bus;
		m_trans.adc_data = vif.adc_in;
		analysis_port.write(m_trans);
		`uvm_info(get_type_name(), $sformatf("ins: %X, adc: %X", vif.instr_bus, vif.adc_in), UVM_MEDIUM);
	end
endtask
// End of inlined include file

// You can insert code here by setting monitor_inc_after_class in file insgen.tpl

`endif // INSGEN_MONITOR_SV

