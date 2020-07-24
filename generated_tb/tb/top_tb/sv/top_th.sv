// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Fri Jul 24 10:11:19 2020
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  timeunit      1ns;
  timeprecision 1ps;

  import verif_pkg::*;

  // Start of inlined include file generated_tb/tb/include/inlines/th_define_clk_and_nreset.sv
    logic clock = 0;
    logic reset;
  
    always #10 clock = ~clock;
  
    initial
    begin
      reset = 0;         // Active low reset in this example
      #75 reset = 1;
    end
  
    assign insgen_if_0.clk = clock;
    assign insgen_if_0.nreset = reset;
  // End of inlined include file

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  insgen_if  insgen_if_0 ();
  memw_if    memw_if_0 ();  

  soc_top uut (
    .instr_bus         (insgen_if_0.instr_bus),
    .adc_in            (insgen_if_0.adc_in),
    .mem_rw            (memw_if_0.mem_rw),
    .mem_wstrobe       (memw_if_0.mem_wstrobe),
    .out_data_bus      (memw_if_0.out_data_bus),
    .out_addr_bus      (memw_if_0.out_addr_bus),
    .out_data_bus_port2(memw_if_0.out_data_bus_port2),
    .out_addr_bus_port2(memw_if_0.out_addr_bus_port2),
    .clk               (clk),
    .nreset            (nreset)
  );

endmodule

