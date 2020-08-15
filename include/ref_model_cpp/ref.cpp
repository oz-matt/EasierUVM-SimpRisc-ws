
#include "svdpi.h"
#include "cref.h"
#include <iostream>

extern "C" {

void cpu_resolve(const cpu_output_t*);
void get_reference_output(const insgen_pkt_t* ip);

void get_reference_output(const insgen_pkt_t* ip) {
	 CRef* c = CRef::get_instance();
  c->execute(ip);
  
  //const cpu_output_t* t = c->get_cpu_output();
cpu_output_t t;
t.out_data_bus = 5;
	t.out_addr_bus = 6;
	t.in_data_bus=4;
	t.memrw=4;
	t.wstrobe=7;
	cpu_resolve(&t);
}

}
