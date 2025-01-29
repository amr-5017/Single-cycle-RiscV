module reg_file(rs1_addr,rs2_addr,rd_addr,reg_write,wb_data,rs1_data,rs2_data);
input logic [4:0]rs1_addr,rs2_addr,rd_addr;
input logic reg_write;
input logic [31:0]wb_data;
output logic [31:0]rs1_data,rs2_data;

logic [31:0]register[31:0];

initial begin
for (int i = 0; i < 32; i++) begin
register[i] = 32'b0; // Initialize all registers to zero
register[1] = 32'd1;
register[2] = 32'd2;
register[3] = 32'd3;
register[4] = 32'd4;
register[5] = 32'd5;
register[6] = 32'd6;
register[7] = 32'd7;
register[8] = 32'd8;
register[9] = 32'd9;
register[10] = 32'd10;
register[11] = 32'd11;
register[12] = 32'd12;
end
end


 always @(*) begin
        if(rs1_addr!=0)
        rs1_data<= register[rs1_addr];
        else
        rs1_data<=0;
        
        if(rs2_addr!=0)
        rs2_data<=register[rs2_addr];
        else
        rs2_data<=0;
        end

always @(*)
    begin
        if (reg_write && rd_addr != 5'b00000) begin // Don't write to register zero
            register[rd_addr]<= wb_data;
        end
    end
endmodule
