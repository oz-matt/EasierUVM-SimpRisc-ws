// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: reference.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Jan  5 04:18:25 2021
//=============================================================================
// Description: Reference model for use with Syosil scoreboard
//=============================================================================

`ifndef REFERENCE_SV
`define REFERENCE_SV

// Start of inlined include file generated_tb/tb/include/reference_inc_before_class.sv
import "DPI-C" function void get_reference_output(insgen_pkt_t ip);
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
	// this trans_rand_ins object comes from the insgen monitor  
	memw_obj m;
	insgen_pkt_t s;
	cpu_output_t c;
	
	s.instruction = t.rand_instruction;
	s.name = 1;
	
	get_reference_output(s); // calls cpu_resolve when finished
	
	if(!uvm_config_db#(cpu_output_t)::get(null, "", "cpu_output", c))
		`uvm_fatal("REF", "Failed to get reference output");
	
	m = memw_obj::type_id::create("m");
	m.out_data_bus = c.out_data_bus;
	m.out_addr_bus = c.out_addr_bus;
	m.in_data_bus = c.in_data_bus;
	m.mem_rw = c.memrw;
	m.mem_wstrobe = c.wstrobe;
	
	`uvm_info(get_type_name(), $sformatf({"\r\n\r\nout_data_bus: %X \r\n",
			"out_addr_bus: %X  \r\n",
			"in_data_bus: %X  \r\n",
			"mem_rw: %X  \r\n",
		"mem_wstrobe: %X \r\n\r\n"}, 
		m.out_data_bus, 
		m.out_addr_bus,
		m.in_data_bus, 
		m.mem_rw, 
		m.mem_wstrobe), UVM_MEDIUM)
	
	analysis_port_0.write(m);
	
endfunction

function void cpu_resolve(cpu_output_t t);
	uvm_config_db#(cpu_output_t)::set(null, "*", "cpu_output", t);
	// cpu_output_t must NOT be a packed struct. For some reason, a packed struct caused 
	// this 't' object to be written in reverse (wstrobe was = to out_data_bus etc)
endfunction
// End of inlined include file

`endif // REFERENCE_SV

