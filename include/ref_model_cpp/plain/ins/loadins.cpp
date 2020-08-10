
#include "loadins.h"
#include "ibase.h"

LoadIns::LoadIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  this->imm = (instruction >> 20) & 0x0FFF;
}

int LoadIns::get_imm()
{
  return this->imm;
}
