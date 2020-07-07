agent_name = insgen
trans_item = trans
trans_var  = rand logic[31:0] rand_instruction;
trans_var  = rand logic[31:0] adc_data;

if_port    = logic clk;
if_port    = logic nreset;
if_port    = logic[31:0] data_bus;
if_port    = logic[31:0] addr_bus;
if_port    = logic[31:0] adc_in;
if_clock   = clk

driver_inc = insgen_driver_inc.sv   inline
monitor_inc = insgen_monitor_inc.sv inline
agent_cover_inc   = insgen_cover_inc.sv  inline

trans_inc_inside_class = ins_constraints.sv inline
