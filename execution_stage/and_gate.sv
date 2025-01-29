module and_gate(zero,branch,and_out);
input logic zero;
input logic branch;
output logic and_out;
assign and_out = branch & zero;  
endmodule
