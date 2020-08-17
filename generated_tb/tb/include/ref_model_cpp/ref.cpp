
#include "svdpi.h"
#include "cref.h"
#include <iostream>

extern "C" {

void cpu_resolve(const cpu_output_t*);
void get_reference_output(const insgen_pkt_t* ip);

void get_reference_output(const insgen_pkt_t* ip) {
	 CRef* c = CRef::get_instance();
  c->execute(ip);
  
  const cpu_output_t* t = c->get_cpu_output();

std::cout << "--------------------------------" << std::endl;
std::cout << "outd:" << t->out_data_bus << std::endl;
std::cout << "outa:" << t->out_addr_bus << std::endl;
std::cout << "ind:" << t->in_data_bus << std::endl;
std::cout << "memrw:" << t->memrw << std::endl;
std::cout << "wstrobe:" << t->wstrobe << std::endl;
std::cout << "--------------------------------" << std::endl;

	cpu_resolve(t);
}

}
