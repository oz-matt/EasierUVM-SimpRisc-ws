
#include "ipkt.h"
#include "ibase.h"
#include <string>

Ipkt::Ipkt(int instruction)
{
  instruction_type_t n = get_instruction_name(instruction);
  
  //ib = new Ibase(n);
}

Ibase* Ipkt::get_derived_instruction_obj(instruction_type_t name)
{
  
  Ibase* ret;
    
  if(name == LW)
  {
    LoadIns* li = new();
    ret = li;
  }
  
  return ret;
}


instruction_type_t Ipkt::get_instruction_name(int instruction)
{
  int opcode = instruction & 0x7F;
  int funct3 = (instruction >> 12) & 0x03;
  int aluc = (instruction >> 30) & 0x01;
  int ebit = (instruction >> 20) & 0x01;

  switch(opcode)
  {
    case 0x37:
      return LUI;
      
    case 0x17:
      return AUIPC;
      
    case 0x6F:
      return JAL;
      
    case 0x67:
      return JALR;
      
    case 0x63:
      switch(funct3)
      {
	case 0x00:
	  return BEQ;
	  
	case 0x01:
	  return BNE;
	  
	case 0x04:
	  return BLT;
	  
	case 0x05:
	  return BGE;
	  
	case 0x06:
	  return BLTU;
	  
	case 0x07:
	  return BGEU;
	  
	default:
	  return NOP;
      }
      break;
      
    case 0x03:
      switch(funct3)
      {
	case 0x00:
	  return LB;
	  
	case 0x01:
	  return LH;
	  
	case 0x02:
	  return LW;
	  
	case 0x04:
	  return LBU;
	  
	case 0x05:
	  return LHU;
	  
	default:
	  return NOP;
      }
      break;
      
      case 0x23:
      switch(funct3)
      {
	case 0x00:
	  return SB;
	  
	case 0x01:
	  return SH;
	  
	case 0x02:
	  return SW;
	  
	default:
	  return NOP;
      }
      break;
      
      case 0x13:
      switch(funct3)
      {
	case 0x00:
	  return ADDI;
	  
	case 0x01:
	  return SLLI;
	  
	case 0x02:
	  return SLTI;
	  
	case 0x03:
	  return SLTIU;
	  
	case 0x04:
	  return XORI;
	  
	case 0x06:
	  return ORI;
	  
	case 0x07:
	  return ANDI;
	  
	case 0x05:
	  if(aluc) return SRAI;
	  else return SRLI;
	  break;
	  
	default:
	  return NOP;
      }
      break;
      
    case 0x33:
      if(aluc)
      {
	if (funct3 == 0x05) return SRA;
	else if (funct3 == 0x00) return SUB;
	else return NOP;
      }
      else
      {
	 switch(funct3)
         {
	case 0x00:
	  return ADD;
	  
	case 0x01:
	  return SLL;
	  
	case 0x02:
	  return SLT;
	  
	case 0x03:
	  return SLTU;
	  
	case 0x04:
	  return XOR;
	  
	case 0x05:
	  return SRL;
	  
	case 0x06:
	  return OR;
	  
	case 0x07:
	  return AND;
	  
	default:
	  return NOP;
      }
	
      }
      break;
      
      case 0x0F:
	return FENCE;
	
      case 0x73:
	if(ebit) return EBREAK;
	else return ECALL;
	
    default:
      return NOP;
  }
  return NOP;
}

std::string Ipkt::get_name_str()
{
  switch(ib->name)
  {
    case LUI: return "LUI"; 
    case AUIPC: return "AUIPC"; 
    case JAL: return "JAL"; 
    case JALR: return "JALR"; 
    case BEQ: return "BEQ"; 
    case BNE: return "BNE"; 
    case BLT: return "BLT"; 
    case BGE: return "BGE"; 
    case BLTU: return "BLTU";
    
    case BGEU: return "BGEU"; 
    case LB: return "LB"; 
    case LH: return "LH"; 
    case LW: return "LW"; 
    case LBU: return "LBU"; 
    case LHU: return "LHU"; 
    case SB: return "SB"; 
    case SH: return "SH"; 
    case SW: return "SW"; 
    case ADDI: return "ADDI";
    
    case SLTI: return "SLTI"; 
    case SLTIU: return "SLTIU"; 
    case XORI: return "XORI"; 
    case ORI: return "ORI"; 
    case ANDI: return "ANDI"; 
    case SLLI: return "SLLI"; 
    case SRLI: return "SRLI"; 
    case SRAI: return "SRAI";
    
    case ADD: return "ADD";
    case SUB: return "SUB"; 
    case SLL: return "SLL"; 
    case SLT: return "SLT"; 
    case SLTU: return "SLTU"; 
    case XOR: return "XOR"; 
    case SRL: return "SRL"; 
    case SRA: return "SRA"; 
    case OR: return "OR";
    
    case AND: return "AND"; 
    case FENCE: return "FENCE"; 
    case ECALL: return "ECALL"; 
    case EBREAK: return "EBREAK"; 
    case NOP: return "NOP";
    
    default: return "UNDEF_INS";
  }
}

