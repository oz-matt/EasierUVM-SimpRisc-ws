#include "cref.h"

CRef::CRef()
{
	c = new();
}

void CRef::gg(const insgen_pkt_t* ip)
{
	c->out_data_bus = 2;
	c->out_addr_bus = 9;
	c->in_data_bus = ip->instruction-1;
}
