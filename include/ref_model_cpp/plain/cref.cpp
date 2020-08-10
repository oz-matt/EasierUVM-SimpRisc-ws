
#include "cref.h"
#include "ipkt.h"
#include "ins/ibase.h"
#include <string>
#include <stdio.h>
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
	Ipkt* i = new Ipkt();
	Ibase* k = i->get_derived_instruction_obj(0x6880A003);
	
	std::cout << k->get_name_str() << " " << k->rd << "," 
	<< k->sign_extend32(12, k->get_imm())
	<< "(" << k->rs1 << ")" << std::endl;
	
	c->out_data_bus = 2;
	c->out_addr_bus = 9;
	c->in_data_bus = ip->instruction-1;
}
