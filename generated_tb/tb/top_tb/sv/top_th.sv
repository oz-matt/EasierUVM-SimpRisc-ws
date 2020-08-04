// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Tue Aug  4 23:34:09 2020
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;

  // Start of inlined include file generated_tb/tb/include/inlines/th_define_clk_and_nreset.sv
  	logic clk = 0;
  	logic nreset;
  	
  	byte ram[int];
  
  	always #10 clk = ~clk;
  
  	initial
  	begin
  		nreset = 0;         // Active low reset in this example
  		#15 nreset = 1;
  	end
  
  	assign insgen_if_0.clk = clk;
  	assign insgen_if_0.nreset = nreset;
  
  	always @(posedge clk) begin
  		if(memw_if_0.mem_rw) begin
  			if(memw_if_0.mem_wstrobe & 'b0001) ram[memw_if_0.out_addr_bus] <= memw_if_0.out_data_bus[7:0];
  			if(memw_if_0.mem_wstrobe & 'b0010) ram[memw_if_0.out_addr_bus + 1] <= memw_if_0.out_data_bus[15:8];
  			if(memw_if_0.mem_wstrobe & 'b0100) ram[memw_if_0.out_addr_bus + 2] <= memw_if_0.out_data_bus[23:16];
  			if(memw_if_0.mem_wstrobe & 'b1000) ram[memw_if_0.out_addr_bus + 3] <= memw_if_0.out_data_bus[31:24];
  		end
  		else begin
  			if(memw_if_0.mem_wstrobe & 'b0001) memw_if_0.in_data_bus[7:0] <= ram[memw_if_0.out_addr_bus];
  			if(memw_if_0.mem_wstrobe & 'b0010) memw_if_0.in_data_bus[15:8] <= ram[memw_if_0.out_addr_bus + 1];
  			if(memw_if_0.mem_wstrobe & 'b0100) memw_if_0.in_data_bus[23:16] <= ram[memw_if_0.out_addr_bus + 2];
  			if(memw_if_0.mem_wstrobe & 'b1000) memw_if_0.in_data_bus[31:24] <= ram[memw_if_0.out_addr_bus + 3];
  		end
  			
  	end
  
  // End of inlined include file

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  insgen_if  insgen_if_0 ();
  memw_if    memw_if_0 ();  

  soc_top uut (
    .instr_bus         (insgen_if_0.instr_bus),
    .pc_out            (insgen_if_0.pc_out),
    .adc_in            (insgen_if_0.adc_in),
    .mem_rw            (memw_if_0.mem_rw),
    .memclk            (memw_if_0.memclk),
    .mem_wstrobe       (memw_if_0.mem_wstrobe),
    .out_data_bus      (memw_if_0.out_data_bus),
    .out_addr_bus      (memw_if_0.out_addr_bus),
    .out_data_bus_port2(memw_if_0.out_data_bus_port2),
    .out_addr_bus_port2(memw_if_0.out_addr_bus_port2),
    .in_data_bus       (memw_if_0.in_data_bus),
    .clk               (clk),
    .nreset            (nreset)
  );

endmodule

