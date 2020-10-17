
`include "sequences/fill_rxs_seq.sv"
`include "sequences/rand_ins_seq.sv"

class vseq_riseq extends top_default_seq;
	`uvm_object_utils(vseq_riseq)

	extern function new(string name = "");
	extern task body();
	extern task pre_start();
	extern task post_start();

endclass : vseq_riseq

function vseq_riseq::new(string name = "");
	super.new(name);
endfunction : new


task vseq_riseq::body();
	//`uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

	int rx_fill_ctr = 0;
	
	repeat(32)
		begin
		fill_rxs_seq seq1;
		seq1 = fill_rxs_seq::type_id::create("seq1");
		seq1.set_item_context(this, m_insgen_agent.m_sequencer);
		if ( !seq1.randomize() )
			`uvm_error(get_type_name(), "Failed to randomize seq1")
			seq1.m_config = m_insgen_agent.m_config;
		seq1.set_starting_phase( get_starting_phase() );
		seq1.start(m_insgen_agent.m_sequencer, this);
	end
	
	repeat (m_seq_count)
	begin
				insgen_default_seq seq2;
				seq2 = insgen_default_seq::type_id::create("seq2");
				seq2.set_item_context(this, m_insgen_agent.m_sequencer);
				if ( !seq2.randomize() )
					`uvm_error(get_type_name(), "Failed to randomize seq2")
				seq2.m_config = m_insgen_agent.m_config;
				seq2.set_starting_phase( get_starting_phase() );
				seq2.start(m_insgen_agent.m_sequencer, this);
	end

	`uvm_info("ANALOG", $sformatf("Starting PLL Confirmation at %d", $time), UVM_MEDIUM);

	`uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


task vseq_riseq::pre_start();
	uvm_phase phase = get_starting_phase();
	if (phase != null)
		phase.raise_objection(this);
endtask: pre_start


task vseq_riseq::post_start();
	uvm_phase phase = get_starting_phase();
	if (phase != null) 
		phase.drop_objection(this);
endtask: post_start
