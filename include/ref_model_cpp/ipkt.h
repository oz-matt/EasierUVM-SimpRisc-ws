	
#ifndef _IPKT_H_
#define _IPKT_H_

#include "ipkt.h"
#include "ins/ibase.h"

class Ipkt {

public:
Ipkt() {};

Ibase* get_derived_instruction_obj(int instruction);
instruction_type_t get_instruction_name(int instruction);

private:
Ibase* ib;

};

#endif