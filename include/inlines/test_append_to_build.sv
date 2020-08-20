
isi.push_back(liit.l);
isi.push_back(liit.a);

r1.set_raw_bits(32'h001120A3); // rx[1] => ram[rx[2] + 1]
r2.set_raw_bits(32'h00112123); // rx[1] => ram[rx[2] + 2]
r3.set_raw_bits(32'h001121A3); // rx[1] => ram[rx[2] + 3]

isi.push_back(r1);
isi.push_back(r2);
isi.push_back(r3);

uvm_config_db#(instruction_base_si[$])::set(this, "m_insgen_agent.*", "directs", isi);

