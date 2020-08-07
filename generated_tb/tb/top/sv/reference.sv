// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: reference.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Aug  7 16:53:51 2020
//=============================================================================
// Description: Reference model for use with Syosil scoreboard
//=============================================================================

`ifndef REFERENCE_SV
`define REFERENCE_SV

// Start of inlined include file generated_tb/tb/include/reference_inc_before_class.sv
import "DPI-C" function void somethin(insgen_pkt_t ip);
export "DPI-C" function cpu_resolve;// End of inlined include file


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
	insgen_pkt_t s;
	int n;
	
	m= memw_obj::type_id::create("m");
	m.out_data_bus = t.rand_instruction;
	n = t.rand_instruction;
	
	s.instruction = 5;
	s.name = 1;
	analysis_port_0.write(m);
	
	somethin(s); // calls cpu_resolve when finished
	
	
	//`uvm_warning("P", $sformatf("In Ref!!: %X, %X, %X", c.out_data_bus, c.out_addr_bus, c.in_data_bus));
	`uvm_warning("P", $sformatf("In Ref!!: %X", n));
endfunction

function void cpu_resolve(int a, int b, int c);
	`uvm_warning("P", $sformatf("disppp:%X, %X, %X", a, b, c));
endfunction// End of inlined include file

`endif // REFERENCE_SV

