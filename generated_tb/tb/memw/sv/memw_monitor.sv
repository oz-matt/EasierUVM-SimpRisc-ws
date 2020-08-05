// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: memw_monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Thu Aug  6 05:55:36 2020
//=============================================================================
// Description: Monitor for memw
//=============================================================================

`ifndef MEMW_MONITOR_SV
`define MEMW_MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file memw.tpl

class memw_monitor extends uvm_monitor;

  `uvm_component_utils(memw_monitor)

  virtual memw_if vif;

  memw_config     m_config;

  uvm_analysis_port #(memw_obj) analysis_port;

  memw_obj m_trans;

  extern function new(string name, uvm_component parent);

  // Methods run_phase, and do_mon generated by setting monitor_inc in file memw.tpl
  extern task run_phase(uvm_phase phase);
  extern task do_mon();

  // You can insert code here by setting monitor_inc_inside_class in file memw.tpl

endclass : memw_monitor 


function memw_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


task memw_monitor::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "run_phase", UVM_HIGH)

  m_trans = memw_obj::type_id::create("m_trans");
  do_mon();
endtask : run_phase


// Start of inlined include file generated_tb/tb/include/inlines/memw_do_mon.sv
task memw_monitor::do_mon;
	forever @(posedge vif.memclk)
	begin
		//if (vif.nreset) bein
		m_trans.out_data_bus = vif.out_data_bus;
		//m_trans.out_data_bus_port2 = vif.out_data_bus_port2;
		//m_trans.out_addr_bus_port2 = vif.out_addr_bus_port2;
		m_trans.out_addr_bus = vif.out_addr_bus;
		m_trans.in_data_bus = vif.in_data_bus;
		//m_trans.mem_rw = vif.mem_rw;
		//m_trans.mem_wstrobe = vif.mem_wstrobe;
		
		/*`uvm_info(get_type_name(), $sformatf({"\r\n\r\nout_data_bus: %X \r\n",
			"out_data_bus_port2: %X  \r\n",
			"out_addr_bus_port2: %X  \r\n",
			"out_addr_bus: %X  \r\n",
			"in_data_bus: %X  \r\n",
			"mem_rw: %X  \r\n",
		"mem_wstrobe: %X \r\n\r\n"}, 
		m_trans.out_data_bus, m_trans.out_data_bus_port2, 
		m_trans.out_addr_bus_port2, m_trans.out_addr_bus,
		m_trans.in_data_bus, m_trans.mem_rw, 
		m_trans.mem_wstrobe), UVM_MEDIUM)
			*/
		analysis_port.write(m_trans);
	//end
	end
endtask// End of inlined include file

// You can insert code here by setting monitor_inc_after_class in file memw.tpl

`endif // MEMW_MONITOR_SV

