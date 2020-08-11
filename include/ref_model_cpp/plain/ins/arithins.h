	
#ifndef _ARITHINS_H_
#define _ARITHINS_H_

#include <string>
#include "ibase.h"

class ArithIns: public Ibase {
  
  public:
    ArithIns(int instruction, instruction_type_t n);
    ~ArithIns(){};

int get_imm();
std::string get_asm_str();
int get_shamt();

  private:
    int imm;
    int shamt;

};

#endif
