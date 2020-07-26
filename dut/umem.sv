
module umem(masterif.umem io,
						aximem.mem mem,
						wire logic[2:0] insf3);
	
	//byte imemory[int]; //memory space
	
	logic[31:0] odb = 0, odb2 = 0;
	//assign io.out_data_bus = odb;
	assign io.out_data_bus_port2 = odb2;
	
	
	//initial begin
	//  $readmemb("prog.data", imemory);
	//end
	
	always @* begin
			case (insf3)
				
				3'b010: begin
					odb = io.mem_rw ? io.mem_wdata : 0;
				end
				
				3'b001: begin
					odb = io.mem_rw ? {16'h0000, io.mem_wdata[15:0]} : 0;
				end
				
				3'b000: begin
					odb = io.mem_rw ? {24'h000000, io.mem_wdata[7:0]} : 0;
				end
			
			endcase
	end
	
	always @* begin
		io.mem_rdata = io.mem_rw ? 0 : 
	odb;
	end
	
	//always_comb
		//io.instruction = {imemory[io.pc+3], imemory[io.pc+2], imemory[io.pc+1], imemory[io.pc]};
	
	bit[31:0] fixed_addr1;
	bit[31:0] fixed_addr2;
	bit[31:0] fixed_addr3;
	bit[31:0] fixed_addr4;
	
	always_comb begin
		if(mem.axi_mem_addr < 32'hA00001FD) begin
			fixed_addr1 = mem.axi_mem_addr;
			fixed_addr2 = mem.axi_mem_addr + 1;
			fixed_addr3 = mem.axi_mem_addr + 2;
			fixed_addr4 = mem.axi_mem_addr + 3;
		end else if (mem.axi_mem_addr == 32'hA00001FD) begin
			fixed_addr1 = 32'hA00001FD;
			fixed_addr2 = 32'hA00001FE;
			fixed_addr3 = 32'hA00001FF;
			fixed_addr4 = 32'hA0000100;
		end else if (mem.axi_mem_addr == 32'hA00001FE) begin
			fixed_addr1 = 32'hA00001FE;
			fixed_addr2 = 32'hA00001FF;
			fixed_addr3 = 32'hA0000100;
			fixed_addr4 = 32'hA0000101;
		end else if (mem.axi_mem_addr == 32'hA00001FF) begin
			fixed_addr1 = 32'hA00001FF;
			fixed_addr2 = 32'hA0000100;
			fixed_addr3 = 32'hA0000101;
			fixed_addr4 = 32'hA0000101;
		end
	end  
	
	always @* begin
			odb2 = mem.axi_mem_w ? mem.axi_mem_data : 0;
	end
	
	assign io.out_addr_bus_port2 = mem.axi_mem_addr;
	
endmodule