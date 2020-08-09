
#include "loadins.h"
#include "ibase.h"

LoadIns::LoadIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  imm = 777;
}

int LoadIns::get_imm()
{
  return imm;
}