dut_top                        = soc_top

nested_config_objects          = yes

common_env_pkg = verif_pkg.sv

top_default_seq_count = 100

th_generate_clock_and_reset = no
th_inc_inside_module = th_define_clk_and_nreset.sv

tb_prepend_to_initial = tb_incs.sv

test_inc_inside_class = test_insert_config.sv inline
test_prepend_to_build_phase = test_insert_config_build.sv inline
