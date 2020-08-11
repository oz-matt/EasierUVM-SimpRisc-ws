
#include "cref.h"
#include "ipkt.h"
#include "ins/ibase.h"
#include <string>
#include <stdio.h>
#include <iostream>

int rx[32];
CRef* CRef::instance = 0;

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
        CRef* c = CRef::get_instance();
	Ipkt* i = new Ipkt();
	Ibase* k = i->get_derived_instruction_obj(0x6880A003);
	
	Iexec exec;
	
	exec.execute(k);
	
	std::cout << c->
	
}

void CRef::set_output(int outd, int outa, int ind)
{
  c->out_data_bus = outd;
  c->out_addr_bus = outa;
  c->in_data_bus = ind;
}
