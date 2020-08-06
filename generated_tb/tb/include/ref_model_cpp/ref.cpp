//#include <stdio.h>
#include "svdpi.h"
#include "cref.h"

extern "C"
int something(const insgen_pkt_t* ip);

int something(const insgen_pkt_t* ip) {
		CRef cr;
		return cr.gg(ip);
		//return ip->instruction;
}
