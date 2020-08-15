#include <iostream>
#include <stdint.h>
#include "cref.h"

using namespace std;

extern int rx[32];

int main()
{
  
  unsigned int g = 0xFFFFFFFF;
  cout << "var:" << (int)g << endl;
  
  for(int i = 0;i<32;i++) rx[i] = -456;
  
  insgen_pkt_t ip;
  ip.instruction = 0x5;
  
  CRef* c = CRef::get_instance();
  c->execute(&ip);
  
  const cpu_output_t* t = c->get_cpu_output();
  
   cout << t->out_addr_bus << endl; 
   cout << t->out_data_bus << endl; 
   cout << t->in_data_bus << endl; 
   cout << t->memrw << endl; 
   cout << t->wstrobe << endl; 
   
   return 0;
}
