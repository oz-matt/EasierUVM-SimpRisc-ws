class vseq_base extends uvm_sequence;
	`uvm_component_utils(vseq_base)
	`uvm_declare_p_sequencer(insgen_sequencer_t)
	
	function new(string name = "vseq_base");
		super.new(name);
	endfunction
	
	fill_rx_seq fillseq;
	rand_ins_seq randseq;
	
	task pre_body();
		fillseq = fill_rx_seq::type_id::create("fillseq");
		randseq = rand_ins_seq::type_id::create("randseq");
	endtask
	
	task body();
		fillseq.start();
		randseq.start();
	endtask
	
endclass
