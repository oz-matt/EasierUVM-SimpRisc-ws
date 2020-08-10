#include "ibase.h"
#include <string>
#include <stdio.h>

Ibase::Ibase(int instruction, instruction_type_t n) 
{
  this->instruction = instruction;
  this->name = n;
  
  this->rd = (instruction >> 7) & 0x1F;
  this->rs1 = (instruction >> 15) & 0x1F;
  this->rs2 = (instruction >> 20) & 0x1F;
}

int Ibase::sign_extend32(int n, int r)
{
  if(r & (1 << (n-1))) return ((0xFFFFFFFF << n) | r);
  else return r;
}

std::string Ibase::get_name_str()
{
  switch(this->name)
  {
    case LUI: return "LUI"; 
    case AUIPC: return "AUIPC"; 
    case JAL: return "JAL"; 
    case JALR: return "JALR"; 
    case BEQ: return "BEQ"; 
    case BNE: return "BNE"; 
    case BLT: return "BLT"; 
    case BGE: return "BGE"; 
    case BLTU: return "BLTU";
    
    case BGEU: return "BGEU"; 
    case LB: return "LB"; 
    case LH: return "LH"; 
    case LW: return "LW"; 
    case LBU: return "LBU"; 
    case LHU: return "LHU"; 
    case SB: return "SB"; 
    case SH: return "SH"; 
    case SW: return "SW"; 
    case ADDI: return "ADDI";
    
    case SLTI: return "SLTI"; 
    case SLTIU: return "SLTIU"; 
    case XORI: return "XORI"; 
    case ORI: return "ORI"; 
    case ANDI: return "ANDI"; 
    case SLLI: return "SLLI"; 
    case SRLI: return "SRLI"; 
    case SRAI: return "SRAI";
    
    case ADD: return "ADD";
    case SUB: return "SUB"; 
    case SLL: return "SLL"; 
    case SLT: return "SLT"; 
    case SLTU: return "SLTU"; 
    case XOR: return "XOR"; 
    case SRL: return "SRL"; 
    case SRA: return "SRA"; 
    case OR: return "OR";
    
    case AND: return "AND"; 
    case FENCE: return "FENCE"; 
    case ECALL: return "ECALL"; 
    case EBREAK: return "EBREAK"; 
    case NOP: return "NOP";
    
    default: return "UNDEF_INS";
  }
}