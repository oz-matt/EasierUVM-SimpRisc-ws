dut_top                        = soc_top

nested_config_objects          = yes

common_env_pkg = /pkg/verif_pkg.sv

top_default_seq_count = 100

th_generate_clock_and_reset = no
th_inc_inside_module = inlines/th_define_clk_and_nreset.sv inline

tb_prepend_to_initial = inlines/tb_incs.sv inline
