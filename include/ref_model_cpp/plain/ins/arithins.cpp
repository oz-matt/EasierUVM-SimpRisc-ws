
#include "arithins.h"
#include "ibase.h"
#include <string>
#include <sstream>

ArithIns::ArithIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
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
      break;
    case I_FORMAT:
      this->imm = instruction >> 20;
      break;
  }
}

int ArithIns::get_imm()
{
  return this->imm;
}

std::string ArithIns::get_asm_str()
{
  
}