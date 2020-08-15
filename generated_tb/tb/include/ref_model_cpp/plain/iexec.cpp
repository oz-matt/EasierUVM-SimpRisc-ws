#include <bits/stdc++.h>
#include "iexec.h"
#include "ins/ibase.h"
#include "cref.h"

extern unsigned int rx[32];
extern unsigned int pc;
extern std::map<int, int> mem;

Iexec::Iexec()
{
      
}
    
void Iexec::execute(Ibase* i)
{
  
  CRef* c = CRef::get_instance();
  
  int outdata = 0, outaddr = 0, indata = 0, mrw = 0, mws = 0;
  
  switch(i->name)
  {
    case SB:
    {
      outdata = rx[i->rs2] & 0xFF;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      mrw = 1;
      mws = 0x1;
      mem[outaddr] = outdata;
    }      
      break;
    
    case SH:
    {
      outdata = rx[i->rs2] & 0xFFFF;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      mrw = 1;
      mws = 0x3;
      mem[outaddr] = outdata;
    }      
      break;
    
    case SW:
    {
      outdata = rx[i->rs2];
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      mrw = 1;
      mws = 0xF;
      mem[outaddr] = outdata;
    }      
      break;
      
      
    case LW:
    {
      mrw = 0;
      mws = 0xF;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = mem[outaddr];
      rx[i->rd] = indata;
    }
      break;
      
    case LH:
    {
      mrw = 0;
      mws = 0x3;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = mem[outaddr] & 0xFFFF;
      rx[i->rd] = i->sign_extend32(16, indata);
    }
      break;
      
    case LHU:
    {
      mrw = 0;
      mws = 0x3;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = mem[outaddr] & 0xFFFF;
      rx[i->rd] = indata;
    }
      break;
      
    case LB:
    {
      mrw = 0;
      mws = 0x1;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = mem[outaddr] & 0xFF;
      rx[i->rd] = i->sign_extend32(8, indata);
    }
      break;
      
    case LBU:
    {
      mrw = 0;
      mws = 0x1;
      outaddr = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
      indata = mem[outaddr] & 0xFF;
      rx[i->rd] = indata;
    }
      break;
    
    case ADDI:
    {
      rx[i->rd] = rx[i->rs1] + i->sign_extend32(12, i->get_imm());
    }
      break;
    
    case SLTI:
    {
      rx[i->rd] = ((int)rx[i->rs1] < (int)i->sign_extend32(12, i->get_imm())) ? 1 : 0;
    }
      break;
    
    case SLTIU:
    {
      rx[i->rd] = (rx[i->rs1] < i->sign_extend32(12, i->get_imm())) ? 1 : 0;
    }
      break;
    
    case ANDI:
    {
      rx[i->rd] = (rx[i->rs1] & i->sign_extend32(12, i->get_imm()));
    }
      break;
    
    case ORI:
    {
      rx[i->rd] = (rx[i->rs1] | i->sign_extend32(12, i->get_imm()));
    }
      break;
    
    case XORI:
    {
      rx[i->rd] = (rx[i->rs1] ^ i->sign_extend32(12, i->get_imm()));
    }
      break;
    
    case ADD:
    {
      rx[i->rd] = rx[i->rs1] + rx[i->rs2];
    }
      break;
    
    case SUB:
    {
      rx[i->rd] = rx[i->rs2] - rx[i->rs1];
    }
      break;
      
    case SLT:
    {
      rx[i->rd] = ((int)rx[i->rs1] < (int)rx[i->rs2]) ? 1 : 0;
    }
      break;
    
    case SLTU:
    {
      rx[i->rd] = (rx[i->rs1] < rx[i->rs2]) ? 1 : 0;
    }
      break;
    
    case AND:
    {
      rx[i->rd] = rx[i->rs1] & rx[i->rs2];
    }
      break;
    
    case OR:
    {
      rx[i->rd] = rx[i->rs1] | rx[i->rs2];
    }
      break;
    
     case XOR:
    {
      rx[i->rd] = rx[i->rs1] ^ rx[i->rs2];
    }
      break;
    
     case SLL:
    {
      rx[i->rd] = rx[i->rs1] << (rx[i->rs2] & 0x1F);
    }
      break;
    
     case SRL:
    {
      rx[i->rd] = rx[i->rs1] >> (rx[i->rs2] & 0x1F);
    }
      break;
    
     case SRA:
    {
      rx[i->rd] = (int)rx[i->rs1] >> (rx[i->rs2] & 0x1F);
    }
      break;
    
    case SLLI:
    {
      rx[i->rd] = rx[i->rs1] << i->rs2;
    }
      break;
    
    case SRLI:
    {
      rx[i->rd] = rx[i->rs1] >> i->rs2;
    }
      break;
    
    case SRAI:
    {
      rx[i->rd] = (int)rx[i->rs1] >> i->rs2;
    }
      break;
    
    case LUI:
    {
      rx[i->rd] = (unsigned int)(i->get_imm() << 12);
    }
      break;
      
    case AUIPC:
    {
      rx[i->rd] = (unsigned int)(i->get_imm() << 12) + pc;
    }
      break;
  }
  
  pc += 4;
  c->set_output(outdata, outaddr, indata, mrw, mws);
  
}