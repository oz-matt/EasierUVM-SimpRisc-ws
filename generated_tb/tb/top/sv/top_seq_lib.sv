// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jan  8 02:10:48 2021
//=============================================================================
// Description: Sequence for top
//=============================================================================

`ifndef TOP_SEQ_LIB_SV
`define TOP_SEQ_LIB_SV

class top_default_seq extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(top_default_seq)

  top_config    m_config;
     
  insgen_agent  m_insgen_agent;
  memw_agent    m_memw_agent;  

  // Number of times to repeat child sequences
  int m_seq_count = 5;

  extern function new(string name = "");
  extern task body();
  extern task pre_start();
  extern task post_start();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

endclass : top_default_seq


function top_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task top_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)


  repeat (m_seq_count)
  begin
    fork
      if (m_insgen_agent.m_config.is_active == UVM_ACTIVE)
      begin
        insgen_default_seq seq;
        seq = insgen_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_insgen_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_insgen_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_insgen_agent.m_sequencer, this);
      end
      if (m_memw_agent.m_config.is_active == UVM_ACTIVE)
      begin
        memw_default_seq seq;
        seq = memw_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_memw_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_memw_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_memw_agent.m_sequencer, this);
      end
    join
  end

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


task top_default_seq::pre_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null)
    phase.raise_objection(this);
endtask: pre_start


task top_default_seq::post_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null) 
    phase.drop_objection(this);
endtask: post_start


`ifndef UVM_POST_VERSION_1_1
function uvm_phase top_default_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void top_default_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// Start of inlined include file generated_tb/tb/include/sequences/vseq_riseq.sv

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
	
	while (m_config.m_insgen_config.vif.pllrdy == 0) begin
		//$display("waiting for cpll. . .");
		/*$display("freq s: %e, mag : %e, vramp: %e", 
			m_config.m_insgen_config.vif.pllfreq, 
			m_config.m_insgen_config.vif.pllmag, 
			m_config.m_insgen_config.vif.pllvra);*/
		
		#1;
	end
	
	$display("************************************");
	$display("|                                  |");
	$display("|                                  |");
	$display("|          CPLL COMPLETED          |");
	$display("|                                  |");
	$display("|                                  |");
	$display("************************************");
	
	/*repeat(32)
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
	end*/

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
// End of inlined include file

`endif // TOP_SEQ_LIB_SV

