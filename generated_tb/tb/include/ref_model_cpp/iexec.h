
#ifndef _IEXEC_H_
#define _IEXEC_H_

#include "ins/ibase.h"

class Iexec{
  
  public:
    Iexec();
    ~Iexec(){};

    void execute(Ibase* i);
    
};


#endif