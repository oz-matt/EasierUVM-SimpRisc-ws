
#include "storeins.h"
#include "ibase.h"
#include <string>
#include <sstream>

StoreIns::StoreIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  this->imm = ((instruction >> 20) & 0x0FE0) | ((instruction >> 7) & 0x1F);
}

int StoreIns::get_imm()
{
  return this->imm;
}

std::string StoreIns::get_asm_str()
{
  std::ostringstream oss;
  
oss << this->get_name_str() << " x" << this->rs2 << "," 
	<< this->sign_extend32(12, this->get_imm())
	<< "(x" << this->rs1 << ")" ;
	
return oss.str();
  
}