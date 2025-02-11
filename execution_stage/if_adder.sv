module if_adder#(parameter N=32)(pc,b_muxin,imm_out);
input logic [N-1:0]pc,imm_out;
output logic [N-1:0]b_muxin;
always_comb
b_muxin = pc + imm_out;    // this adder is used to calculate the pc next value by adding the pc old with branch offset for branch instrcution which acts as one of the input for the mux in IF_Stage
endmodule
