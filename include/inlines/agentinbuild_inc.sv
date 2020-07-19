
	if (get_is_active() == UVM_ACTIVE)
	begin
		rig    = rand_ins_gen     ::type_id::create("rig", this);
	end
