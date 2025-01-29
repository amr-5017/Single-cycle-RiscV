module if_adder#(parameter N=32)(pc,b_muxin,imm_out);
input logic [N-1:0]pc,imm_out;
output logic [N-1:0]b_muxin;
always_comb
b_muxin = pc + imm_out;
endmodule
