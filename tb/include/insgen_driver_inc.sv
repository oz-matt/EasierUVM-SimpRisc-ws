task insgen_driver::do_drive();
  vif.data_bus <= req.instruction;
  #10;
endtask