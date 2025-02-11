module and_gate(zero,branch,and_out);
input logic zero;
input logic branch;
output logic and_out;
assign and_out = branch & zero;  //this output acts as the select line for the mux used in IF_Stage for updating the pc value 
endmodule
