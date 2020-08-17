
class raw_instruction_si extends instruction_base_si;
	`uvm_object_utils(raw_instruction_si)
	
	bit[31:0] raw_bits;
	string asm_str = "RAW UNIMP";
	
	function new(string inst_name = "raw_instruction_si");
		super.new(inst_name);
	endfunction

	virtual function bit[31:0] get_raw_bits();
		return raw_bits;
	endfunction
	
	function void set_raw_bits(bit[31:0] raw);
		raw_bits = raw;
		rd = raw[11:7];
		rs1 = raw[19:15];
		rs2 = raw[24:20];
		asm_str = get_asm_str_from_raw(raw);
	endfunction

	virtual function string get_asm_string();
		return asm_str;
	endfunction
	
	function string get_asm_str_from_raw(bit[31:0] raw);
		casex ({raw[30], raw[14:12], raw[6:0]})
			11'bxxxx0110111: return $sformatf("LUI\tx%0d,%0d", rd, raw[31:12]);
			11'bxxxx0010111: return $sformatf("AUIPC\tx%0d,%0d", rd, raw[31:12]);
			//11'bxxxx1101111: return JAL;
			//11'bx0001100111: return JALR;
			//11'bx0001100011: return BEQ;
			//11'bx0011100011: return BNE;
			//11'bx1001100011: return BLT;
			//11'bx1011100011: return BGE;
			//11'bx1101100011: return BLTU;
			//11'bx1111100011: return BGEU;
			11'bx0000000011: return $sformatf("LB\tx%0d,%0d(x%0d)", rd, $signed(`SIGN_EXTEND32(12, raw[31:20])), rs1);
			11'bx0010000011: return $sformatf("LH\tx%0d,%0d(x%0d)", rd, $signed(`SIGN_EXTEND32(12, raw[31:20])), rs1);
			11'bx0100000011: return $sformatf("LW\tx%0d,%0d(x%0d)", rd, $signed(`SIGN_EXTEND32(12, raw[31:20])), rs1);
			11'bx1000000011: return $sformatf("LBU\tx%0d,%0d(x%0d)", rd, $signed(`SIGN_EXTEND32(12, raw[31:20])), rs1);
			11'bx1010000011: return $sformatf("LHU\tx%0d,%0d(x%0d)", rd, $signed(`SIGN_EXTEND32(12, raw[31:20])), rs1);
			11'bx0000100011: return $sformatf("SB\tx%0d,%0d(x%0d)", rs2, $signed(`SIGN_EXTEND32(12, {raw[31:25], raw[11:7]})), rs1);
			11'bx0010100011: return $sformatf("SH\tx%0d,%0d(x%0d)", rs2, $signed(`SIGN_EXTEND32(12, {raw[31:25], raw[11:7]})), rs1);
			11'bx0100100011: return $sformatf("SW\tx%0d,%0d(x%0d)", rs2, $signed(`SIGN_EXTEND32(12, {raw[31:25], raw[11:7]})), rs1);
			11'bx0000010011: return $sformatf("ADDI\tx%0d,x%0d,%0d", rd, rs1, $signed(`SIGN_EXTEND32(12, raw[31:20])));
			11'bx0100010011: return $sformatf("SLTI\tx%0d,x%0d,%0d", rd, rs1, $signed(`SIGN_EXTEND32(12, raw[31:20])));
			11'bx0110010011: return $sformatf("SLTIU\tx%0d,x%0d,%0d", rd, rs1, `SIGN_EXTEND32(12, raw[31:20]));
			11'bx1000010011: return $sformatf("XORI\tx%0d,x%0d,%0d", rd, rs1, $signed(`SIGN_EXTEND32(12, raw[31:20])));
			11'bx1100010011: return $sformatf("ORI\tx%0d,x%0d,%0d", rd, rs1, $signed(`SIGN_EXTEND32(12, raw[31:20])));
			11'bx1110010011: return $sformatf("ANDI\tx%0d,x%0d,%0d", rd, rs1, $signed(`SIGN_EXTEND32(12, raw[31:20])));
			11'b00010010011: return $sformatf("SLLI\tx%0d,x%0d,%0d", rd, rs1, raw[24:20]);
			11'b01010010011: return $sformatf("SRLI\tx%0d,x%0d,%0d", rd, rs1, raw[24:20]);
			11'b11010010011: return $sformatf("SRAI\tx%0d,x%0d,%0d", rd, rs1, raw[24:20]);
			11'b00000110011: return $sformatf("ADD\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b10000110011: return $sformatf("SUB\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b00010110011: return $sformatf("SLL\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b00100110011: return $sformatf("SLT\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b00110110011: return $sformatf("SLTU\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b01000110011: return $sformatf("XOR\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b01010110011: return $sformatf("SRL\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b11010110011: return $sformatf("SRA\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b01100110011: return $sformatf("OR\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'b01110110011: return $sformatf("AND\tx%0d,x%0d,x%0d", rd, rs1, rs2);
			11'bx0000001111: return FENCE;
			11'b00001110011: 
				if(raw[20] == 1'b1)
					return EBREAK;
				else
					return ECALL;
			default: return NOP;
		endcase
	endfunction
	
endclass

