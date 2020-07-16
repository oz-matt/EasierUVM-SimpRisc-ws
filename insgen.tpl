agent_name = insgen
trans_item = trans
trans_var  = rand logic[31:0] rand_instruction;
trans_var  = rand logic[31:0] adc_data;

if_port    = logic clk;
if_port    = logic nreset;
if_port    = logic[31:0] instr_bus;
if_port    = logic[31:0] in_data_bus;
if_port    = logic[31:0] adc_in;
if_port    = wire mem_rw;
if_port    = logic[3:0] mem_wstrobe;
if_port    = logic[31:0] pc_out;
if_port    = logic[31:0] out_data_bus;
if_port    = logic[31:0] out_addr_bus;
if_port    = logic[31:0] out_data_bus_port2;
if_port    = logic[31:0] out_addr_bus_port2;
if_clock   = clk

driver_inc = insgen_driver_inc.sv   inline
monitor_inc = insgen_monitor_inc.sv inline
agent_cover_inc   = insgen_cover_inc.sv  inline
agent_inc_inside_class   = agentinclass_inc.sv  inline
trans_inc_inside_class = ins_constraints.sv inline
agent_append_to_build_phase   =   agentinbuild_inc.sv inline
driver_inc_inside_class = dclass_inc.sv inline
agent_append_to_connect_phase   = agentinconnect_inc.sv inline




