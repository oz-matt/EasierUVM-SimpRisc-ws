
	typedef struct {
		arithmetic_instruction_si l;
		arithmetic_instruction_si a;
	} li_instruction_t;
	
	
typedef struct {
	int instruction;
	int name;
} insgen_pkt_t;

typedef struct packed {
	int out_data_bus;
	int out_addr_bus;
	int in_data_bus;
} cpu_output_t;