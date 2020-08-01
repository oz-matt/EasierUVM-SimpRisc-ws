dut_top                        = soc_top

nested_config_objects          = yes

common_env_pkg = /pkg/verif_pkg.sv

top_default_seq_count = 5

th_generate_clock_and_reset = no
th_inc_inside_module = inlines/th_define_clk_and_nreset.sv inline

tb_prepend_to_initial = inlines/tb_incs.sv inline

test_inc_inside_class = inlines/test_insert_config_afterc.sv inline
test_inc_after_class = inlines/test_insert_config.sv inline

