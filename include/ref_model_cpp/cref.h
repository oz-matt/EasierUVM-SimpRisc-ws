	
#ifndef _CREF_H_
#define _CREF_H_

#include "svdpi.h"
#include "svdpi_src.h"

typedef struct {
	int instruction;
	int name;
} insgen_pkt_t;

typedef struct {
	int out_data_bus;
	int out_addr_bus;
	int in_data_bus;
	int memrw;
} cpu_output_t;


class CRef {

public:
CRef();
void gg(const insgen_pkt_t* ip);
const cpu_output_t* get_cpu_output();

private:
cpu_output_t* c;

};

#endif
