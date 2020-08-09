
#include "storeins.h"
#include "ibase.h"

StoreIns::StoreIns(int instruction, instruction_type_t n) : Ibase(instruction, n)
{
  imm = 777;
}

int StoreIns::get_imm()
{
  return imm;
}