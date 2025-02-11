//All submodules are instantiated in the top module i.e IF stage.

module if_stage #(parameter N=32)
(
    input logic clk, and_out, reset, 
    input logic [N-1:0] b_muxin,
    output logic [N-1:0] if_out, pc, pc_new
);

    wire [N-1:0] pc_next;

    (* DONT_TOUCH = "TRUE" *) adder #(N) add (.pc(pc), .b(4), .pc_new(pc_new));
    (* DONT_TOUCH = "TRUE" *) mux21 mu (.a(pc_new), .b(b_muxin), .control(and_out), .y(pc_next));
    (* DONT_TOUCH = "TRUE" *) Program_Counter programc (.pc_next(pc_next), .pc(pc), .clk(clk), .reset(reset));
    (* DONT_TOUCH = "TRUE" *) instruction_memory im (.addr(pc), .inst(if_out));

endmodule
