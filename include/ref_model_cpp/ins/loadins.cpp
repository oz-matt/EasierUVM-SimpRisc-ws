
#include "loadins.h"
#include "ibase.h"
#include <string>
#include <sstream>

LoadIns::LoadIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  this->imm = (instruction >> 20) & 0x0FFF;
}

int LoadIns::get_imm()
{
  return this->imm;
}

std::string LoadIns::get_asm_str()
{
  std::ostringstream oss;
  
oss << this->get_name_str() << " x" << this->rd << "," 
	<< this->sign_extend32(12, this->get_imm())
	<< "(x" << this->rs1 << ")" ;
	
return oss.str();
  
}