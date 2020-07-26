
module memslave(axilite_int.slave io, aximem.axim memaxi);

	logic valid_read_received;
	logic write_request_permitted;

	logic[31:0] mem[255:0];

	always_comb begin
		valid_read_received = io.AXI_ARVALID && io.AXI_ARREADY;
		write_request_permitted = io.AXI_AWVALID && io.AXI_AWREADY && io.AXI_WVALID && io.AXI_WREADY;
		end

	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_ARREADY <= 0;
		else if (valid_read_received)
			io.AXI_ARREADY <= 0;
		else if (io.AXI_ARVALID)
			io.AXI_ARREADY <= 1;
		else
			io.AXI_ARREADY <= 0;
	end
	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_AWREADY <= 0;
		else if (write_request_permitted)
			io.AXI_AWREADY <= 0;
		else if (io.AXI_AWVALID)
			io.AXI_AWREADY <= 1;
		else
			io.AXI_AWREADY <= 0;
	end
	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_WREADY <= 0;
		else if (write_request_permitted)
			io.AXI_WREADY <= 0;
		else if (io.AXI_WVALID)
			io.AXI_WREADY <= 1;
		else
			io.AXI_WREADY <= 0;
	end

	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_RVALID <= 0;
		else if (valid_read_received)
			io.AXI_RVALID <= 1;
		else
			io.AXI_RVALID <= 0;
	end

	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_BVALID <= 0;
		else if (write_request_permitted)
			io.AXI_BVALID <= 1;
		else
			io.AXI_BVALID <= 0;
	end

	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_RDATA <= 0;
		else if (valid_read_received)
			io.AXI_RDATA <= mem[io.AXI_ARADDR];
		else
			io.AXI_RDATA <= 0;
	end

	always_ff @(posedge write_request_permitted  or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN) begin
		memaxi.axi_mem_w <= 0;
		memaxi.axi_mem_addr <= 0;
		memaxi.axi_mem_data <= 0;
		end
		else begin 
			mem[io.AXI_AWADDR] <= io.AXI_WDATA;
		memaxi.axi_mem_w <= 1;
		memaxi.axi_mem_addr <= io.AXI_AWADDR;
		memaxi.axi_mem_data <= io.AXI_WDATA;
		end
	end

endmodule