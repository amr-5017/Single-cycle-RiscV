module mux21 
(
    input logic [31:0] a, b,
    input logic control,
    output logic [31:0] y
);

    assign y = control ? b : a;       // selects between the branch address or pc+4 address

endmodule
