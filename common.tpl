dut_top                        = soc_top

nested_config_objects          = yes

common_env_pkg = /pkg/verif_pkg.sv

top_default_seq_count = 100

syosil_scoreboard_src_path = uvm_syoscb/src

ref_model_compare_method    = reference io

ref_model_input  = reference m_insgen_agent

ref_model_output = reference m_memw_agent

ref_model_inc_before_class = reference reference_inc_before_class.sv  inline
ref_model_inc_inside_class  = reference reference_inc_inside_class.sv  inline
ref_model_inc_after_class   = reference reference_inc_after_class.sv   inline

th_generate_clock_and_reset = no
th_inc_inside_module = inlines/th_define_clk_and_nreset.sv inline

tb_prepend_to_initial = inlines/tb_incs.sv inline

test_prepend_to_build_phase = inlines/test_prepend_build.sv inline

test_inc_after_class = inlines/include_tests.sv inline

top_env_generate_run_phase = no
top_env_inc_after_class = inlines/top_env_run.sv inline
top_env_inc_inside_class = inlines/top_env_dec.sv inline

