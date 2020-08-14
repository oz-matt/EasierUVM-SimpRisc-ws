#include "cref.h"

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
	c->out_data_bus = 2;
	c->out_addr_bus = 9;
	c->in_data_bus = ip->instruction-1;
	c->memrw = 1;
	c->wstrobe = 1;
}
