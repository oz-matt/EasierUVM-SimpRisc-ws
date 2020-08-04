// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: reference.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug  4 23:34:09 2020
//=============================================================================
// Description: Reference model for use with Syosil scoreboard
//=============================================================================

`ifndef REFERENCE_SV
`define REFERENCE_SV

// You can insert code here by setting ref_model_inc_before_class in file common.tpl


`uvm_analysis_imp_decl(_reference_0)

class reference extends uvm_component;
  `uvm_component_utils(reference)

  uvm_analysis_imp_reference_0 #(trans_rand_ins, reference) analysis_export_0; // m_insgen_agent

  uvm_analysis_port #(uvm_sequence_item) analysis_port_0; // m_memw_agent

  extern function new(string name, uvm_component parent);
  extern function void write_reference_0(input trans_rand_ins t);

  // Start of inlined include file generated_tb/tb/include/reference_inc_inside_class.sv
  // End of inlined include file

endclass


function reference::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_export_0 = new("analysis_export_0", this);
  analysis_port_0   = new("analysis_port_0",   this);
endfunction : new


// Start of inlined include file generated_tb/tb/include/reference_inc_after_class.sv
function void reference::write_reference_0(trans_rand_ins t);
	memw_obj m;
	m= memw_obj::type_id::create("m");
	m.out_data_bus = 32'hEEFFEEFF;
	analysis_port_0.write(m);
	`uvm_warning("P", $sformatf("In Ref!!: %X", t.rand_instruction))
endfunction// End of inlined include file

`endif // REFERENCE_SV

