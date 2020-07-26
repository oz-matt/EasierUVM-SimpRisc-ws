
interface aximem ();

	logic[31:0] axi_mem_data;
	logic[31:0] axi_mem_addr;
	logic axi_mem_w;
	
	modport mem (
		input axi_mem_w,
		input axi_mem_addr,
		input axi_mem_data
	);
	
	modport axim (
		output axi_mem_w,
		output axi_mem_addr,
		output axi_mem_data
	);
	
endinterface
