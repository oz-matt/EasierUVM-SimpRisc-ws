
module dut_top(
  input logic clk,
  input logic nreset,
  input logic[31:0] data_bus,
  output logic[31:0] addr_bus
);
  
  
  mdriver_int#(32,32) vif(.*);
  axi_master_wrapper axi_master_wrapper_inst(.io(vif.slave), .mem(aximem_inst.axim));
  cpu cpu_inst(.*, .io(aximem_inst.mem));
  sindrv sindrv_inst(.io(vif.master));
  aximem aximem_inst();
  
endmodule
