dut_top                        = soc_top

top_default_seq_count = 100

th_generate_clock_and_reset = no
th_inc_inside_module = th_define_clk_and_nreset.sv

tb_prepend_to_initial = tb_incs.sv
