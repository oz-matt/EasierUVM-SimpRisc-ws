covergroup m_cov;
	option.per_instance = 1;
	cp_data: coverpoint m_item.adc_data {
		bins zero = {0};
		bins one  = {1};
		bins positive = { [1: 127] };
		option.at_least = 16;
	}
endgroup

