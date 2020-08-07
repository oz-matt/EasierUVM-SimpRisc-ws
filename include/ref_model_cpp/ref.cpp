//#include <stdio.h>
#include "svdpi.h"
#include "cref.h"


extern "C" {

void cpu_resolve(int, int, int);
void somethin(const insgen_pkt_t* ip);

void somethin(const insgen_pkt_t* ip) {
		//CRef cr;
		//return cr.gg(ip);
		//*(int*)c = 2;
	//c->out_addr_bus = 9;
	//c->in_data_bus = ip->instruction-1;
	cpu_resolve(2, 77, ip->instruction-1);
}

}
