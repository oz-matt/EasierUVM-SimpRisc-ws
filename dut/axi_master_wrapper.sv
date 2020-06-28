

module axi_master_wrapper(mdriver_int.slave io, aximem.axim mem);

  axilite_int#(32,32) vif();

	typedef enum integer {
		IDLE,
		EXECUTING_READ,
		EXECUTING_WRITE,
		WAITING_READ,
		WAITING_WRITE
	} pstate_t;

	pstate_t pstate;

  memslave memslave_inst(.io(vif.slave), .memaxi(mem));
  
  logic[31:0] adcdata;

	integer local_data;
	logic   ready_for_data;
	logic   ready_for_write_response;
	logic   valid_read_data_received;
	logic   valid_write_response_received;

	logic finread;
	logic finwrite;

	assign vif.AXI_ACLK = io.clk;
	assign vif.AXI_ARESETN = io.nreset;
	assign io.so_data = local_data;
	assign io.fin = io.we ? finwrite : finread;
	assign vif.AXI_RREADY = ready_for_data;
	assign vif.AXI_BREADY = ready_for_write_response;

	always_ff @(posedge io.clk or negedge io.nreset) begin
		if (!io.nreset) begin
			vif.AXI_ARVALID <= 0;
			vif.AXI_AWVALID <= 0;
			vif.AXI_WVALID <= 0;
            pstate <= IDLE;
		end
		else begin
			case (pstate)
				IDLE : begin
					vif.AXI_ARVALID <= 0;
					vif.AXI_AWVALID <= 0;
					vif.AXI_WVALID <= 0;
					if (io.exec)
						pstate <= io.we ? EXECUTING_WRITE : EXECUTING_READ;
				end

				EXECUTING_READ : begin
					vif.AXI_ARVALID <= 1;
					if(vif.AXI_ARVALID && vif.AXI_ARREADY) begin
						vif.AXI_ARVALID <= 0;
						pstate <= WAITING_READ;
					end
				end

				EXECUTING_WRITE : begin
					vif.AXI_AWVALID <= 1;
					vif.AXI_WVALID <= 1;
					if(vif.AXI_AWVALID && vif.AXI_AWREADY && vif.AXI_WVALID && vif.AXI_WREADY) begin
						vif.AXI_AWVALID <= 0;
						vif.AXI_WVALID <= 0;
						pstate <= WAITING_WRITE;
					end
				end

				WAITING_READ : begin
					if (finread) pstate <= IDLE;
				end

				WAITING_WRITE : begin
					if (finwrite) pstate <= IDLE;
				end

			endcase
		end
	end

	always_comb begin
		valid_read_data_received = vif.AXI_RVALID && vif.AXI_RREADY;
		valid_write_response_received = vif.AXI_BVALID && vif.AXI_BREADY;
	end

	assign vif.AXI_ARADDR = (vif.AXI_ARVALID && (pstate == EXECUTING_READ)) ? io.si_address : 0;

	assign vif.AXI_AWADDR = (vif.AXI_AWVALID && (pstate == EXECUTING_WRITE)) ? io.si_address : 0;

	assign vif.AXI_WDATA = (vif.AXI_WVALID && (pstate == EXECUTING_WRITE)) ? io.si_data : 0;

	always_ff @ (posedge io.clk or negedge io.nreset) begin
      if (!io.nreset) begin
        finread <= 0;
			ready_for_data <= 0;
        local_data <= 0;
      end
		else if (finread) begin
			finread <= 0;
			ready_for_data <= 1;
		end
		else if (valid_read_data_received) begin
			local_data <= vif.AXI_RDATA;
			ready_for_data <= 0;
			finread <= 1;
		end
		else if (vif.AXI_RVALID)
			ready_for_data <= 1;
		else
			ready_for_data <= 1;
	end

	always_ff @ (posedge io.clk or negedge io.nreset) begin
      if (!io.nreset) begin
			ready_for_write_response <= 0;
         finwrite <= 0;
      end
		else if (finwrite) begin
			ready_for_write_response <= 1;
			finwrite <= 0;
		end
		else if (valid_write_response_received) begin
			ready_for_write_response <= 0;
			finwrite <= 1;
		end
		else if (vif.AXI_BVALID)
			ready_for_write_response <= 1;
		else
			ready_for_write_response <= 1;
	end

endmodule

