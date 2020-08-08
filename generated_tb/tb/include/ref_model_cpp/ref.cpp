
#include "svdpi.h"
#include "cref.h"


extern "C" {

void cpu_resolve(const cpu_output_t*);
void get_reference_output(const insgen_pkt_t* ip);

void get_reference_output(const insgen_pkt_t* ip) {
	CRef cr;
	
	cr.gg(ip);
	
	cpu_resolve(cr.get_cpu_output());
}

}
