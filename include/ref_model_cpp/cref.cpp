#include "cref.h"

int CRef::gg(const insgen_pkt_t* ip)
{
		return ip->instruction-1;
}
