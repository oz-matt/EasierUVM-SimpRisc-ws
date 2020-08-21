class insgen_prand_inorder_ins_seq extends insgen_prand_ins_seq;

	`uvm_object_utils(insgen_prand_inorder_ins_seq)

	extern function new(string name = "");
	extern virtual function void mid_do(uvm_sequence_item this_item);

endclass

function insgen_prand_inorder_ins_seq::new(string name = "");
	super.new(name);
endfunction : new

function void insgen_prand_inorder_ins_seq::mid_do(uvm_sequence_item this_item);
	trans_rand_ins pkt;
	$cast(pkt, this_item);
	if(m_config.ic.size() > 0) pkt.ibsi = m_config.ic.pop_front();
	else pkt.ibsi = new();
endfunction : mid_do

