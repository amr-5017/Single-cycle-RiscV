module instruction_memory (input logic [31:0]addr,output logic [31:0]inst);
//logic [9:0] addrTemp;
(* KEEP = "True" *)reg [7:0]mem[0:2047];

initial begin
    $readmemh("C:/Users/Lenovo/Downloads/program.data", mem);
  end
  
//inst = mem[addr];
    assign inst = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};

endmodule
