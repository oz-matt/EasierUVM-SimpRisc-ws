#include <iostream>
#include "cref.h"

using namespace std;

int main()
{
  
  insgen_pkt_t ip;
  ip.instruction = 50;
  ip.name = 3;
  
  CRef* c = CRef::get_instance();
  c->gg(&ip);
  
  cpu_output_t t;
  t = *(c->get_cpu_output());
  
   cout << t.in_data_bus << endl; 
   
   return 0;
}
