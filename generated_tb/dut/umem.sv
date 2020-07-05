module umem(masterif.umem io,
						aximem.mem mem,
						wire logic[2:0] insf3);
	
	byte imemory[int]; //memory space
	
	
	//initial begin
	//  $readmemb("prog.data", imemory);
	//end
	
	always @* begin
		if(io.mem_rw) begin
			case (insf3)
				
				3'b010: begin
					imemory[io.mem_addr] = io.mem_wdata[7:0];
					imemory[io.mem_addr + 1] = io.mem_wdata[15:8];
					imemory[io.mem_addr + 2] = io.mem_wdata[23:16];
					imemory[io.mem_addr + 3] = io.mem_wdata[31:24];
				end
				
				3'b001: begin
					imemory[io.mem_addr] = io.mem_wdata[7:0];
					imemory[io.mem_addr + 1] = io.mem_wdata[15:8];
				end
				
				3'b000: begin
					imemory[io.mem_addr] = io.mem_wdata[7:0];
				end
			
			endcase
		end
	end
	
	always @*
		io.mem_rdata = io.mem_rw ? 0 : 
	{imemory[io.mem_addr + 3], 
	imemory[io.mem_addr + 2], 
	imemory[io.mem_addr + 1], 
			imemory[io.mem_addr]};
	
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
		if(mem.axi_mem_w) begin
			imemory[fixed_addr1] = mem.axi_mem_data[7:0];
			imemory[fixed_addr2] = mem.axi_mem_data[15:8];
			imemory[fixed_addr3] = mem.axi_mem_data[23:16];
			imemory[fixed_addr4] = mem.axi_mem_data[31:24];
		end
	end
	
endmodule