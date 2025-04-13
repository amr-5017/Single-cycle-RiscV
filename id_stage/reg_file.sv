module reg_file(
    input logic [4:0] rs1_sel, rs2_sel,
    input logic reg_write, clk, reset,
    input logic [31:0] wb_data,
    input logic [31:0] out, 
    output logic [31:0] rs1_data, rs2_data
);

    logic [31:0] register [31:0];
    logic [31:0] en;

    always_comb begin
        rs1_data = register[rs1_sel];
        rs2_data = register[rs2_sel];
    end

    always @(posedge clk or posedge reset) begin
        integer i;
        if (reset) begin
            for (i = 0; i < 32; i++) begin
                register[i] <= 32'b0;
            end
        end else begin
            for (i = 0; i < 32; i++) begin
           
                if (out[i] & reg_write)
                    register[i] <=  wb_data;
            end
        end
    end

    

endmodule
