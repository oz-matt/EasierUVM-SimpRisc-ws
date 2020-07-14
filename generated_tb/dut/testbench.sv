module tb();
  logic clk, nreset;
  
  logic[31:0] instr_bus = 32'h00000013; //32'h00112023;// 32'h0040A003;
  logic[31:0] pc_out;
  logic[31:0] out_data_bus;
  logic[31:0] in_data_bus;
  wire[31:0] out_data_bus_port2;
  wire[31:0] out_addr_bus_port2;
  logic[31:0] adc_in =32'h11111111;
  logic[31:0] out_addr_bus;
  wire mem_rw;
  logic[3:0] mem_wstrobe;
  
  initial begin
    clk <= 0;
    forever #1 clk <= !clk;
  end
  
  initial begin
    #3
  forever #2 adc_in <= adc_in+ 1;
  end
  
  soc_top soc_top_inst(.*);
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
    nreset <= 0;
    //vif.nreset <= 0;
    #4
    nreset <= 1;
    //vif.nreset <= 1;
    
    #13
    instr_bus = 32'h00112023;
    #2
    instr_bus = 32'h00000013;
    /*data_bus = 32'h00112023;
    #2
    data_bus = 32'h00312023;
    #2
    data_bus = 32'h00112023;
    #2
    data_bus = 32'h00312023;
    #2
    data_bus = 32'h00112023;
    #2
    data_bus = 32'h00312023;
    #2
    data_bus = 32'h00112023;
    #2
    data_bus = 32'h00312023;
    #2*/
    
    //vif.execute_write(0, 'hb4b4b4b4);

    //vif.execute_write(0, 'hb4b4b4b4);
    //vif.execute_read(0); //Value then avilable in vif.so_data

    //$display("Read data: %X", vif.so_data);
   
    
    #80;
    //disp_rx(cpu_inst.mif.rx);
    //disp_umem(cpu_inst.umem_inst.umemory);
    $finish;
  end
  
endmodule

function void disp_rx(input logic[31:0] h[31:0]);
  $display("rx[0]: %X", h[0]);
  $display("rx[1]: %X", h[1]);
  $display("rx[2]: %X", h[2]);
  $display("rx[3]: %b", h[3]);
endfunction

function void disp_umem(input reg[7:0] h[0:255]);
  $display("umem[0]: %X", h[0]);
  $display("umem[1]: %X", h[1]);
  $display("umem[2]: %X", h[2]);
  $display("umem[3]: %X", h[3]);
  $display("umem[4]: %X", h[4]);
  $display("umem[5]: %X", h[5]);
endfunction
