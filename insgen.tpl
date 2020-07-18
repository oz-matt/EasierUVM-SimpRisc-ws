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

driver_inc = inlines/insgen_driver_inc.sv   inline
monitor_inc = inlines/insgen_monitor_inc.sv inline
agent_cover_inc   = inlines/insgen_cover_inc.sv  inline
agent_inc_inside_class   = inlines/agentinclass_inc.sv  inline
trans_inc_inside_class = inlines/ins_constraints.sv inline
agent_append_to_build_phase   =   inlines/agentinbuild_inc.sv inline
driver_inc_inside_class = inlines/dclass_inc.sv inline
agent_append_to_connect_phase   = inlines/agentinconnect_inc.sv inline

config_var = boolean init_cpu_regs_with_rand_vals;
config_var = instr_category_bm allowed_instr_types;

agent_config_generate_methods_inside_class = no
agent_config_generate_methods_after_class = no
agent_config_inc_inside_class = inlines/config_externs.sv inline
agent_config_inc_after_class = inlines/config_new.sv inline

