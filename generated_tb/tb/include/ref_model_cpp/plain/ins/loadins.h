	
#ifndef _LOADINS_H_
#define _LOADINS_H_

#include <string>
#include "ibase.h"

class LoadIns: public Ibase {
  
  public:
    LoadIns(int instruction, instruction_type_t n);
    ~LoadIns(){};

int get_imm();
std::string get_asm_str();

  private:
    int imm;

};

#endif
