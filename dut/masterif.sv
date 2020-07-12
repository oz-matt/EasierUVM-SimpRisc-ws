interface masterif (
	input logic clk,
	input logic nreset,
	output logic[31:0] out_data_bus,
);
	
	logic[31:0] rx [31:0];
	
	wire[31:0] rx0, rx1, rx2, rx3;
	assign rx0 = rx[0];
	assign rx1 = rx[1];
	assign rx2 = rx[2];
	assign rx3 = rx[3];
	
	//logic[31:0] instruction;
	
	logic[31:0] mem_wdata;
	logic[31:0] mem_rdata;
	bit[31:0] mem_addr;
	logic mem_rw;
	
	
	modport umem (
		input clk,
		//input pc,
		output out_data_bus,
		input mem_wdata,
		output mem_rdata,
		input mem_addr,
		input mem_rw
	);
	
endinterface