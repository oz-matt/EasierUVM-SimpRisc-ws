	
#ifndef _IBASE_H_
#define _IBASE_H_

#include <string>

typedef enum {
    //RV32I base instructions
    LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU,
    BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI,
    SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR,
    AND, FENCE, ECALL, EBREAK, NOP
} instruction_type_t;

typedef enum {
	J_FORMAT,
	U_FORMAT,
	I_FORMAT,
	I_FORMAT_SHIFT,
	B_FORMAT,
	R_FORMAT,
	S_FORMAT
} riscv_instr_format_t;


class Ibase {

public:
  
Ibase(int instruction, instruction_type_t n);
virtual ~Ibase(){};

virtual int get_imm() = 0;
virtual std::string get_asm_str() = 0;
virtual int get_shamt();

std::string get_name_str();
riscv_instr_format_t get_format(instruction_type_t n);
unsigned int sign_extend32(int n, int r);

riscv_instr_format_t format;
instruction_type_t name;
int instruction, rd, rs1, rs2;

};

#endif
