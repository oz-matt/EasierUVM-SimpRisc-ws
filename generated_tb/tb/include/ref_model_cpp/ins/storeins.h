	
#ifndef _STOREINS_H_
#define _STOREINS_H_

#include <string>
#include "ibase.h"

class StoreIns: public Ibase {
  
  public:
    StoreIns(int instruction, instruction_type_t n);
    ~StoreIns(){};

int get_imm();
std::string get_asm_str();

  private:
    int imm;

};

#endif
