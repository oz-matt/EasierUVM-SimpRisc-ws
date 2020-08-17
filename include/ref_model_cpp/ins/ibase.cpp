#include "ibase.h"
#include <string>
#include <stdio.h>
#include <iostream>

Ibase::Ibase(int instruction, instruction_type_t n) 
{
  this->instruction = instruction;
  this->name = n;
  
  this->format = get_format(n);
  
  this->rd = (instruction >> 7) & 0x1F;
  this->rs1 = (instruction >> 15) & 0x1F;
  this->rs2 = (instruction >> 20) & 0x1F;
}

unsigned int Ibase::sign_extend32(int n, int r)
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

riscv_instr_format_t Ibase::get_format(instruction_type_t n)
{
  switch(n)
  {
    case LUI: return U_FORMAT; 
    case AUIPC: return U_FORMAT; 
    case JAL: return J_FORMAT; 
    case JALR: return I_FORMAT; 
    case BEQ: return B_FORMAT; 
    case BNE: return B_FORMAT; 
    case BLT: return B_FORMAT; 
    case BGE: return B_FORMAT; 
    case BLTU: return B_FORMAT;
    
    case BGEU: return B_FORMAT;
    case LB: return I_FORMAT;
    case LH: return I_FORMAT;
    case LW: return I_FORMAT;
    case LBU: return I_FORMAT;
    case LHU: return I_FORMAT;
    case SB: return S_FORMAT;
    case SH: return S_FORMAT;
    case SW: return S_FORMAT;
    case ADDI: return I_FORMAT;
    
    case SLTI: return I_FORMAT;
    case SLTIU: return I_FORMAT;
    case XORI: return I_FORMAT;
    case ORI: return I_FORMAT;
    case ANDI: return I_FORMAT;
    case SLLI: return I_FORMAT_SHIFT;
    case SRLI: return I_FORMAT_SHIFT;
    case SRAI: return I_FORMAT_SHIFT;
    
    case ADD: return R_FORMAT;
    case SUB: return R_FORMAT;
    case SLL: return R_FORMAT;
    case SLT: return R_FORMAT;
    case SLTU: return R_FORMAT;
    case XOR: return R_FORMAT;
    case SRL: return R_FORMAT;
    case SRA: return R_FORMAT;
    case OR: return R_FORMAT;
    
    case AND: return R_FORMAT;
    case FENCE: return I_FORMAT;
    case ECALL: return I_FORMAT;
    case EBREAK: return I_FORMAT;
    case NOP: return I_FORMAT;
    
    default: return I_FORMAT;
  }
}

int Ibase::get_shamt()
{
  return 0;
}
