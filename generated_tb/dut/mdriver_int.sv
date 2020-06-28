`ifndef MDRIVER_INT
`define MDRIVER_INT

interface mdriver_int #(
		parameter integer C_AXI_DATA_WIDTH	= 32,
		parameter integer C_AXI_ADDR_WIDTH	= 32
)(
 input logic clk,
  input logic nreset
);
	
	logic[C_AXI_ADDR_WIDTH-1:0]					si_address;
	logic[C_AXI_DATA_WIDTH-1:0]					si_data;
	logic[C_AXI_DATA_WIDTH-1:0]					so_data;
	logic										we;
  	logic										exec;
    logic										fin;
  
    task execute_write(byte addr, int data);
    we <= 1;
      si_address <= addr;
      si_data <= data;
      exec <= 1; 
      @(posedge fin);
      exec <= 0;
      @(negedge fin);
  endtask
  
  task execute_read(byte addr);
    we <= 0;
      si_address <= addr;
      exec <= 1;
      @(posedge fin);
      exec <= 0;
      @(negedge fin);
  endtask
  
	
	modport master
	(
		input									clk,
		input									nreset,
		output 									si_address,
		output 									si_data,
		input 									so_data,
		output 									we,
        output									exec,
        input									fin
	);
	
	modport slave
	(
		input									clk,
		input									nreset,
		input 									si_address,
		input 									si_data,
		output 									so_data,
		input 									we,
        input									exec,
        output									fin
	);
  
  
	
endinterface : mdriver_int

`endif