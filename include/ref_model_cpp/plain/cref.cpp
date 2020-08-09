
#include "cref.h"
#include "ipkt.h"
#include "ibase.h"
#include <string>
#include <iostream>

CRef::CRef()
{
	c = new cpu_output_t;
}

const cpu_output_t* CRef::get_cpu_output()
{
	return (const cpu_output_t*)c;
}

void CRef::gg(const insgen_pkt_t* ip)
{
	Ipkt* i = new Ipkt(0x0040A003);
	Ibase* k = i->get_derived_instruction_obj(i->get_instruction_name(0x0040A003));
	std::cout << k->get_imm() << std::endl;
	c->out_data_bus = 2;
	c->out_addr_bus = 9;
	c->in_data_bus = ip->instruction-1;
}
