module control_gen(opcode,and_out,gen_out,U_control);
input logic [6:0]opcode;
input logic and_out;
output logic gen_out;
output logic [1:0]U_control;

always_comb
begin
gen_out = 0;
U_control = 2'b0;
case(opcode)
7'b1100011: //Branch
if(and_out == 1)
gen_out = 1;

7'b1101111: //Jal
begin
gen_out = 1;
U_control = 2'b00;
end

7'b0110111: //lui
U_control = 2'b01;

7'b0010111: //auipc
U_control = 2'b10;

default: 
begin
U_control = 2'b0;
gen_out = 0;
end
endcase
end
endmodule
