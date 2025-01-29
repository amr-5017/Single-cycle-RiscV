module adder #(parameter N=32)
(
    input logic [N-1:0] pc, b,
    output logic [N-1:0] pc_new
);

    assign pc_new = pc + b;

endmodule
