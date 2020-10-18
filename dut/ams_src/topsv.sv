`include "src/top.vams"

module topsv();

top();


initial begin
  #10
  $finish;
end

endmodule