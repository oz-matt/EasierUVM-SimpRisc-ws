
#include "arithins.h"
#include "ibase.h"
#include <string>
#include <sstream>

ArithIns::ArithIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  this->shamt = 0;
  switch(this->format)
  {
    case R_FORMAT:
      this->imm = 0;
      break;
    case U_FORMAT:
      this->imm = instruction >> 12;
      break;
    case I_FORMAT_SHIFT:
      this->imm = instruction >> 20;
      this->shamt = (instruction >> 20) & 0x7F;
      break;
    case I_FORMAT:
      this->imm = instruction >> 20;
      break;
  }
}

int ArithIns::get_shamt()
{
  return this->shamt;
}

int ArithIns::get_imm()
{
  return this->imm;
}

std::string ArithIns::get_asm_str()
{
  std::ostringstream oss;
  
    switch(this->format)
  {
    case R_FORMAT:
    {
      oss << this->get_name_str() << " x" << this->rd << ",x" << this->rs1 << ",x" << this->rs2;
      break;
    }
    
    case U_FORMAT:
    {
      oss << this->get_name_str() << " x" << this->rd << "," << this->get_imm();
      break;
    }
    
    case I_FORMAT_SHIFT:
    {
      oss << this->get_name_str() << " x" << this->rd << ",x" << this->rs1 << "," << this->get_shamt();
      break;
    }
    
    case I_FORMAT:
    {
      oss << this->get_name_str() << " x" << this->rd << ",x" << this->rs1 << "," << this->sign_extend32(12, this->get_imm());
      break;
    }
    
    
    default:
    {
      oss << "ASMERR";
      break;
    }
    
  }
  
  return oss.str();
}