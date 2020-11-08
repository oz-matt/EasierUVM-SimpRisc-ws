
class asmutils;
	static function instr_category_bm get_rand_type_from_mask(int mask);
		int rand_pick, bit_pick;
		int bitq[$];
		instr_category_bm new_bm;
	
	
		for(int i=0;i<32;i++) begin
			if(mask & (1 << i)) bitq.push_back(i);
		end
		
		rand_pick = $urandom_range(bitq.size(), 1);
		
		bit_pick = bitq[rand_pick - 1];
		
		$cast(new_bm, 1 << bit_pick);

		return new_bm;
		
	endfunction
	
	static function instruction_base_si get_rand_instruction(int typemask);
		
		instr_category_bm new_mask = get_rand_type_from_mask(typemask);
		instruction_base_si ret;
		
		case(new_mask)
			LOAD : begin
				load_instruction_si li = new();
				li.randomize() with {
					format inside {I_FORMAT};
					name inside {LW, LH, LHU, LB, LBU};
				};
				ret = li;
			end
			STORE : begin
				store_instruction_si si = new();
				si.randomize() with {
		format inside {S_FORMAT};
		name inside {SW, SH, SB};
				};
				ret = si;
			end
			ARITHMETIC : begin
				arithmetic_instruction_si ai = new();
				ai.randomize() with {
					solve format before name;
					format inside {R_FORMAT, U_FORMAT, I_FORMAT, I_FORMAT_SHIFT};
		(format == R_FORMAT) -> name inside {ADD, SLT, SLTU, AND,
			OR, XOR, SLL, SRL, SUB, SRA};
		(format == U_FORMAT) -> name inside {LUI, AUIPC};
		(format == I_FORMAT_SHIFT) -> name inside {SLLI, SRLI, SRAI};
		(format == I_FORMAT) -> name inside {ADDI, SLTI, ANDI, ORI, XORI};
				};
				ret = ai;
			end
		endcase
		
		return ret;
	endfunction
	
	static function li_instruction_t get_rand_li_pseudo(int dest);
		
		li_instruction_t ret;
		
		arithmetic_instruction_si luiins = new();
		arithmetic_instruction_si addiins = new();
		
		luiins.randomize() with {
			solve format before name;
			format inside {U_FORMAT};
			name inside {LUI};
			rd == dest;
		};
		
		addiins.randomize() with {
			solve format before name;
			format inside {I_FORMAT};
			name inside {ADDI};
			rd == dest;
			rs1 == dest;
		};
		
		ret.l = luiins;
		ret.a = addiins;
		
		return ret;
		
	endfunction
	
	static function real check_pll_rdy();
		return top_tb.th.rdy;
	endfunction
	
endclass