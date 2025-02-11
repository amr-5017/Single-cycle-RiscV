module Program_Counter 
(
    input logic [31:0] pc_next,
    input logic clk, reset,
    output logic [31:0] pc
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'b0;
        else
            pc <= pc_next;// when reset is zero the pc is updated with new pc value which is the output of the mux(either the branch address or pc+4(the next address))
    end

endmodule
