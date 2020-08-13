#include <iostream>
#include "cref.h"

using namespace std;

extern int rx[32];

int main()
{
  
  for(int i = 0;i<32;i++) rx[i] = -456;
  
  insgen_pkt_t ip;
  ip.instruction = 0xAAC4AAA3;
  ip.name = 3;
  
  CRef* c = CRef::get_instance();
  c->execute(&ip);
  
  const cpu_output_t* t = c->get_cpu_output();
  
   cout << t->out_addr_bus << endl; 
   cout << t->out_data_bus << endl; 
   cout << t->in_data_bus << endl; 
   cout << t->memrw << endl; 
   
   return 0;
}
