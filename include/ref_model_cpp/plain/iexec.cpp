
#include "iexec.h"
#include "ins/ibase.h"
#include "cref.h"

extern int rx[32];

Iexec::Iexec()
{
      
}
    
void Iexec::execute(Ibase* i)
{
  
  CRef* c = CRef::get_instance();
  
  int outdata, outaddr, indata;
  
  switch(i->name)
  {
    case SB:
    {
      outdata = rx[i->rs2] & 0xFF;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = 0;
    }      
      break;
    
    case SH:
    {
      outdata = rx[i->rs2] & 0xFFFF;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = 0;
    }      
      break;
    
    case SW:
    {
      outdata = rx[i->rs2];
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = 0;
    }      
      break;
    
    default: return;
  }
  
  c->set_output(outdata, outaddr, indata);
}