agent_name = memw

trans_item = memw_obj
trans_var  = logic[31:0] out_data_bus;
trans_var  = logic[31:0] out_addr_bus;
#trans_var  = logic[31:0] out_data_bus_port2;
#trans_var  = logic[31:0] out_addr_bus_port2;
trans_var  = logic[31:0] in_data_bus;
trans_var  = logic mem_rw;
#trans_var  = logic memclk;
trans_var  = logic[3:0] mem_wstrobe;

if_port    = logic clk;
if_port    = logic nreset;
if_port    = logic mem_rw;
if_port    = logic memclk;
if_port    = logic[3:0] mem_wstrobe;
if_port    = logic[31:0] out_data_bus;
if_port    = logic[31:0] out_addr_bus;
if_port    = logic[31:0] out_data_bus_port2;
if_port    = logic[31:0] out_addr_bus_port2;
if_port    = logic[31:0] in_data_bus;
if_clock   = clk
if_reset   = nreset

monitor_inc = inlines/memw_do_mon.sv inline
if_inc_inside_interface = inlines/memw_if_inc_inside_interface.sv inline

agent_is_active = uvm_passive

