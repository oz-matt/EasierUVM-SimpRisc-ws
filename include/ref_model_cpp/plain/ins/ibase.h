	
#ifndef _IBASE_H_
#define _IBASE_H_

#include <string>

typedef enum {
    //RV32I base instructions
    LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU,
    BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI,
    SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR,
    AND, FENCE, ECALL, EBREAK, NOP, 
} instruction_type_t;

class Ibase {

public:
  
Ibase(int instruction, instruction_type_t n);
virtual ~Ibase(){};

virtual int get_imm() = 0;
virtual std::string get_asm_str() = 0;

std::string get_name_str();
int sign_extend32(int n, int r);

instruction_type_t name;
int instruction, rd, rs1, rs2;

};

#endif
