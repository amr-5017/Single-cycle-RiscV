module decoder #(parameter N=32)(if_out,rs1,rs2,rd,opcode,fn3,imm,imm_uj,fn7_5,imm11_5,fn7_1);
input logic [N-1:0]if_out;
output logic [4:0]rs1,rs2,rd;
output logic [6:0]opcode,imm11_5;
output logic [2:0]fn3;
output logic [11:0]imm;
output logic [19:0]imm_uj;
output logic fn7_5,fn7_1;

always_comb
begin
rd = 0;            //rd = destination register specifies register which will receive result of computation
fn3 = 0;           //fn3 = This field identifies the operation under a class of instruction
rs1 = 0;           // rs1 = source register 1 specifies register containing first operand 
rs2 = 0;           // rs2 = source register 2 specifies register containing second operand 
imm = 0;           // immediate 12-bit value
imm_uj = 0;        //immediate 20-bit value
imm11_5 = 0;
fn7_5 = 0;
fn7_1 = 0;
opcode = if_out[6:0];    //This field identifies class/basic operation of Instructions like, LOAD, STORE, OP-Immediate type, OP- register type, Branch 

case(opcode)
    7'b0110011: //R-Type and M-Type
    begin
        rd = if_out[11:7];
        fn3 = if_out[14:12];
        rs1 = if_out[19:15];
        rs2 = if_out[24:20];
        fn7_5 = if_out[29];
        fn7_1 = if_out[25];
    end
    7'b0010011: //I-Type
    begin
        rd = if_out[11:7];
        fn3 = if_out[14:12];
        rs1 = if_out[19:15];
        imm = if_out[31:20];
        imm11_5 = if_out[31:25];
    end
    7'b0000011: //load
    begin 
        rd = if_out[11:7];
        fn3 = if_out[14:12];
        rs1 = if_out[19:15];
        imm = if_out[31:20];
    end
    7'b0100011: //store
    begin
        fn3 = if_out[14:12];
        rs1 = if_out[19:15];
        rs2 = if_out[24:20];
        imm = {if_out[31:25],if_out[11:7]};
    end
    7'b1100011: //B-Type
    begin
        fn3= if_out[14:12];
        rs1 = if_out[19:15];
        rs2 = if_out[24:20];
        imm = {if_out[31],if_out[7],if_out[30:25],if_out[11:8]};
    end
    7'b1101111: //J-Type
    begin
        rd = if_out[11:7];
        imm_uj = {if_out[31],if_out[19:12],if_out[20],if_out[30:21]};
    end
    7'b0110111: //U-Type
    begin
        rd = if_out[11:7];
        imm_uj = {if_out[31:12]};
    end
    default:
    begin
    rd = 0;
    fn3 = 0;
    rs1 = 0;
    rs2 = 0;
    imm = 0;
    imm_uj = 0;
    imm11_5 = 0;
    fn7_5 = 0;
    opcode = if_out[6:0];
    end 
endcase
end
endmodule
