#include <stdio.h>
#include "svdpi.h"
#include "cref.cpp"

extern "C"
int something(int d);

int something(int d) {
		CRef cr;
		return cr.gg(d);
}
