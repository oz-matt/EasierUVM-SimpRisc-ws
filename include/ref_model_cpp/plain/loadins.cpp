
#include "loadins.h"
#include "ibase.h"

LoadIns::LoadIns(instruction_type_t n) : Ibase(n)
{
  imm = 777;
}

int LoadIns::get_imm()
{
  return imm;
}