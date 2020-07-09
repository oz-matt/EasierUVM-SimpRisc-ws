//insgen_test_config tco;

constraint ins_c {
	rand_instruction inside {32'h0040A003, 32'h00110113};
	adc_data dist {0:=20, 1:=20, [2:128]:/50, [129:(2**32)-1]:/50};
};
