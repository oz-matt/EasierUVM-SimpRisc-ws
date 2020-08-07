//#include <stdio.h>
#include "svdpi.h"
#include "cref.h"


extern "C" {

void cpu_resolve(const cpu_output_t*);
void somethin(const insgen_pkt_t* ip);

void somethin(const insgen_pkt_t* ip) {
		//CRef cr;
		//return cr.gg(ip);
	cpu_output_t t;
	
	t.out_data_bus = 2;
	t.out_addr_bus = 9;
	t.in_data_bus = ip->instruction-1;

	cpu_resolve(&t);
}

}
