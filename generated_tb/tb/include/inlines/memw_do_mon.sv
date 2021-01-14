task memw_monitor::do_mon;
  wait(vif.nreset);
  forever @(posedge vif.memclk)
  begin
    #1;
    //if (vif.nreset) begin
    m_trans.out_data_bus = vif.out_data_bus;
    //m_trans.out_data_bus_port2 = vif.out_data_bus_port2;
    //m_trans.out_addr_bus_port2 = vif.out_addr_bus_port2;
    m_trans.out_addr_bus = vif.out_addr_bus;
    m_trans.in_data_bus = vif.in_data_bus;
    m_trans.mem_rw = vif.mem_rw;
    m_trans.mem_wstrobe = vif.mem_wstrobe;
    
    `uvm_info(get_type_name(), $sformatf({"out_data_bus: %X ",
      "out_addr_bus: %X ",
      "in_data_bus: %X ",
      "mem_rw: %X ",
    "mem_wstrobe: %X "}, 
    m_trans.out_data_bus, 
    //m_trans.out_data_bus_port2, 
    //m_trans.out_addr_bus_port2, 
    m_trans.out_addr_bus,
    m_trans.in_data_bus, 
    m_trans.mem_rw, 
    m_trans.mem_wstrobe), UVM_HIGH)
      
    analysis_port.write(m_trans);
  //end
  end
endtask