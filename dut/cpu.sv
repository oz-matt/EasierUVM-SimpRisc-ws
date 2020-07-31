module cpu (
	input clk,
	input nreset,
	aximem.mem io,
	input logic[31:0] instr_bus,
	input logic[31:0] in_data_bus,
	output logic mem_rw,
	output logic[3:0] mem_wstrobe,
	output logic memclk,
	output logic[31:0] pc_out,
	output logic[31:0] out_data_bus,
	output logic[31:0] out_addr_bus,
	output logic[31:0] out_data_bus_port2,
	output logic[31:0] out_addr_bus_port2
);

	masterif mif(.*);

	instruction_parser instruction(instr_bus);
	
	umem umem_inst(.io(mif.umem), .mem(io), .insf3(instruction.funct3));
	
	
	logic[31:0] pc = 32'h80000000;
	assign pc_out = pc;
	
	logic[31:0] jump;
	
	bit take_branch;
	
	bit rd_w_en;
	assign rd_w_en = instruction.name inside {LW, LH, LHU, LB, 
		LBU, ADDI, SLTI, SLTIU, ANDI, ORI, XORI, ADD, SUB, 
		SLT, SLTU, AND, OR, XOR, SLL, SRL, SRA, JAL, SLLI,
		SRLI, SRAI, LUI, AUIPC} ? 1 : 0;
	
	bit on_branch_instrution;
	assign on_branch_instruction = instruction.name inside {BEQ, 
		BNE, BLT, BLTU, BGE, BGEU} ? 1 : 0;
	
	always @(posedge clk) begin
		if(!nreset) begin
			//pc <= 0;
		end
		else begin
			if(instruction.name == JAL)
				pc <= pc + jump;
			else if (instruction.name == JALR)
				pc <= jump;
			else if (on_branch_instruction) begin
				if (take_branch)
					pc <= jump;
				else
					pc <= pc + 4;
			end
			else
				pc <= pc + 4;
		end
	end
	
	
	always_comb begin
		casex ({instruction.aluc, instruction.funct3, instruction.opcode})
			11'bxxxx0110111: instruction.name = LUI;
			11'bxxxx0010111: instruction.name = AUIPC;
			11'bxxxx1101111: instruction.name = JAL;
			11'bx0001100111: instruction.name = JALR;
			11'bx0001100011: instruction.name = BEQ;
			11'bx0011100011: instruction.name = BNE;
			11'bx1001100011: instruction.name = BLT;
			11'bx1011100011: instruction.name = BGE;
			11'bx1101100011: instruction.name = BLTU;
			11'bx1111100011: instruction.name = BGEU;
			11'bx0000000011: instruction.name = LB;
			11'bx0010000011: instruction.name = LH;
			11'bx0100000011: instruction.name = LW;
			11'bx1000000011: instruction.name = LBU;
			11'bx1010000011: instruction.name = LHU;
			11'bx0000100011: instruction.name = SB;
			11'bx0010100011: instruction.name = SH;
			11'bx0100100011: instruction.name = SW;
			11'bx0000010011: instruction.name = ADDI;
			11'bx0100010011: instruction.name = SLTI;
			11'bx0110010011: instruction.name = SLTIU;
			11'bx1000010011: instruction.name = XORI;
			11'bx1100010011: instruction.name = ORI;
			11'bx1110010011: instruction.name = ANDI;
			11'b00010010011: instruction.name = SLLI;
			11'b01010010011: instruction.name = SRLI;
			11'b11010010011: instruction.name = SRAI;
			11'b00000110011: instruction.name = ADD;
			11'b10000110011: instruction.name = SUB;
			11'b00010110011: instruction.name = SLL;
			11'b00100110011: instruction.name = SLT;
			11'b00110110011: instruction.name = SLTU;
			11'b01000110011: instruction.name = XOR;
			11'b01010110011: instruction.name = SRL;
			11'b11010110011: instruction.name = SRA;
			11'b01100110011: instruction.name = OR;
			11'b01110110011: instruction.name = AND;
			11'bx0000001111: instruction.name = FENCE;
			11'b00001110011: 
				if(instruction.ebit == 1'b1)
					instruction.name = EBREAK;
				else
					instruction.name = ECALL;
			default: instruction.name = NOP;
		endcase
	end
	
	logic[31:0] rdbuffer;
	logic[31:0] gbuf; // general buffer since select-of-concatenate not supported in vcs2016
	
	assign mem_rw = mif.mem_rw;
	
	always_comb begin
		if(!mif.nreset) begin
			out_addr_bus = 0;
			jump = 1;
			out_data_bus = 0;
			mem_wstrobe = 0;
			mif.mem_rw = 0;
		end
		else begin
			case (instruction.name)
				
				LW: begin //Load 32-bit val at umem[rx[rs1] + imm] into rd
					mif.mem_rw = 0;
					mem_wstrobe = 4'b1111;
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
					rdbuffer = in_data_bus;
				end
				
				LH: begin //Load 16-bit val (sign extended to 32-bits) at umem[rx[rs1] + imm] into rd
					mif.mem_rw = 0;
					mem_wstrobe = 4'b0011;
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
					rdbuffer = `SIGN_EXTEND32(16, in_data_bus);
				end
				
				LHU: begin //Load 16-bit val (zero extended to 32-bits) at umem[rx[rs1] + imm] into rd
					mif.mem_rw = 0;
					mem_wstrobe = 4'b0011;
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
					rdbuffer = {16'h0000, in_data_bus[15:0]};
				end
				
				LB: begin //Load 8-bit val (sign extended to 32-bits) at umem[rx[rs1] + imm] into rd
					mif.mem_rw = 0;
					mem_wstrobe = 4'b0001;
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
					rdbuffer = `SIGN_EXTEND32(8, in_data_bus);
				end
				
				LBU: begin //Load 8-bit val (zero extended to 32-bits) at umem[rx[rs1] + imm] into rd
					mif.mem_rw = 0;
					mem_wstrobe = 4'b0001;
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
					rdbuffer = {24'h000000, in_data_bus[7:0]};
				end
				
				SW: begin //Store 32, 16 or 8 bit val from rs2 into umem[rx[rs1] + imm]
					mif.mem_rw = 1; //umem controller uses instruction.funct3 to determine write width
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.s_imm);
									mem_wstrobe = 4'b1111;
					out_data_bus = mif.rx[instruction.rs2];
				end
				SH: begin //Store 32, 16 or 8 bit val from rs2 into umem[rx[rs1] + imm]
					mif.mem_rw = 1; //umem controller uses instruction.funct3 to determine write width
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.s_imm);
									gbuf = mif.rx[instruction.rs2];
									mem_wstrobe = 4'b0011;
									out_data_bus = {16'h0000, gbuf[15:0]};
				end
				SB: begin //Store 32, 16 or 8 bit val from rs2 into umem[rx[rs1] + imm]
					mif.mem_rw = 1; //umem controller uses instruction.funct3 to determine write width
					out_addr_bus = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.s_imm);
					gbuf = mif.rx[instruction.rs2];
									mem_wstrobe = 4'b0001;
									out_data_bus = {24'h000000, gbuf[7:0]};
				end
				
				ADDI: begin
					rdbuffer = mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm);
				end
				
				SLTI: begin
					rdbuffer = ($signed(mif.rx[instruction.rs1]) < $signed(`SIGN_EXTEND32(12, instruction.i_imm))) ? 32'h00000001 : 32'h00000000;
				end
				
				SLTIU: begin
					rdbuffer = (mif.rx[instruction.rs1] < `SIGN_EXTEND32(12, instruction.i_imm)) ? 32'h00000001 : 32'h00000000;
				end
				
				ANDI: begin
					rdbuffer = mif.rx[instruction.rs1] & `SIGN_EXTEND32(12, instruction.i_imm);
				end
				
				ORI: begin
					rdbuffer = mif.rx[instruction.rs1] | `SIGN_EXTEND32(12, instruction.i_imm);
				end
				
				XORI: begin
					rdbuffer = mif.rx[instruction.rs1] ^ `SIGN_EXTEND32(12, instruction.i_imm);
				end
				
				ADD: begin
					rdbuffer = mif.rx[instruction.rs1] + mif.rx[instruction.rs2];
				end
				
				SUB: begin
					rdbuffer = mif.rx[instruction.rs2] - mif.rx[instruction.rs1];
				end
				
				SLT: begin
					rdbuffer = $signed(mif.rx[instruction.rs1]) < $signed(mif.rx[instruction.rs2]) ? 32'h00000001 : 32'h00000000;
				end
				
				SLTU: begin
					rdbuffer = (mif.rx[instruction.rs1] < mif.rx[instruction.rs2]) ? 32'h00000001 : 32'h00000000;
				end
				
				AND: begin
					rdbuffer = mif.rx[instruction.rs1] & mif.rx[instruction.rs2];
				end
				
				OR: begin
					rdbuffer = mif.rx[instruction.rs1] | mif.rx[instruction.rs2];
				end
				
				XOR: begin
					rdbuffer = mif.rx[instruction.rs1] ^ mif.rx[instruction.rs2];
				end
				
				SLL: begin
					gbuf = mif.rx[instruction.rs2];
					rdbuffer = mif.rx[instruction.rs1] << gbuf[4:0];
				end
					
				SRL: begin
					gbuf = mif.rx[instruction.rs2];
					rdbuffer = mif.rx[instruction.rs1] >> gbuf[4:0];
				end
								
				SRA: begin
					gbuf = mif.rx[instruction.rs2];
					rdbuffer = $signed(mif.rx[instruction.rs1]) >>> gbuf[4:0];
				end
				
				JAL: begin
					jump = 2 * `SIGN_EXTEND32(20, instruction.j_imm);
					rdbuffer = pc + 4;
				end
				
				JALR: begin
					gbuf = {mif.rx[instruction.rs1] + `SIGN_EXTEND32(12, instruction.i_imm)};
					jump = {gbuf[31:1], 1'b0};
					rdbuffer = pc + 4;
				end
				
				BEQ: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = (mif.rx[instruction.rs1] == mif.rx[instruction.rs2]) ? 1 : 0;
				end
				
				BNE: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = (mif.rx[instruction.rs1] != mif.rx[instruction.rs2]) ? 1 : 0;
				end
				
				BLT: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = ($signed(mif.rx[instruction.rs1]) < $signed(mif.rx[instruction.rs2])) ? 1 : 0;
				end
				
				BLTU: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = (mif.rx[instruction.rs1] < mif.rx[instruction.rs2]) ? 1 : 0;
				end
				
				BGE: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = ($signed(mif.rx[instruction.rs1]) >= $signed(mif.rx[instruction.rs2])) ? 1 : 0;
				end
				
				BGEU: begin
					jump = pc + 2 * `SIGN_EXTEND32(12, instruction.b_imm);
					take_branch = (mif.rx[instruction.rs1] >= mif.rx[instruction.rs2]) ? 1 : 0;
				end
				
				SLLI: begin
					rdbuffer = mif.rx[instruction.rs1] << instruction.rs2;
				end
					
				SRLI: begin
					rdbuffer = mif.rx[instruction.rs1] >> instruction.rs2;
				end
					
				SRAI: begin
					rdbuffer = $signed(mif.rx[instruction.rs1]) >>> instruction.rs2;
				end
				
				LUI: begin
					rdbuffer = {instruction.u_imm, 12'b000000000000};
				end
				
				AUIPC: begin
					rdbuffer = {instruction.u_imm, 12'b000000000000} + pc;
				end
				
				FENCE: begin
				end
					
				ECALL: begin
				end
					
				EBREAK: begin
				end
				
				C_NOP: begin
				end
				
			endcase
		end
	end
	
	
	always @(posedge clk or negedge mif.nreset) begin
		if(!mif.nreset) begin
			mif.rx <= '{default:32'h39393939};
			/*mif.rx[0] = 0;
					mif.rx[1] = 256;
			mif.rx[2] = 4;
			mif.rx[3] = 44;
			mif.rx[4] = 'hfffffffe;*/
		end
		else begin
			//$display("\r\r\n\n%p\r\r\n\n", mif.rx);
			if(rd_w_en)
				mif.rx[instruction.rd] <= rdbuffer;      
		end
	end
	
				//$display("lw: addr:%X, rs1:%X, rd:%X, imm:%X, rdata:%X, full:%X, res:%X", out_addr_bus, instruction.rs1, instruction.rd, instruction.i_imm, mif.mem_rdata, data_bus, mif.rx[instruction.rd]);
	
endmodule