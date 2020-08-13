	
#ifndef _CREF_H_
#define _CREF_H_


typedef struct {
	int instruction;
	int name;
} insgen_pkt_t;

typedef struct {
	int out_data_bus;
	int out_addr_bus;
	int in_data_bus;
	int memrw;
} cpu_output_t;


class CRef {
  static CRef* instance;  

public:
  CRef();
  
  static CRef *get_instance() {
    if (!instance) instance = new CRef;
    return instance;
  }
   
  void execute(const insgen_pkt_t* ip);
  const cpu_output_t* get_cpu_output();
  void set_output(int outd, int outa, int ind, int rw);

private:
  cpu_output_t* c;

};

#endif