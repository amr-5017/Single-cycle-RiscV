module alu(alu_control,alu_out,zero,rs1_data,rs2_data,fn3,fn7_1);
input logic [3:0]alu_control; // 4-bit control signal to select ALU operation
input logic [2:0]fn3;         // 3-bit function code from instruction (RISC-V funct3)
input logic fn7_1;            // 1-bit signal from funct7 (used for multiplication)
output logic zero;            // Output flag, set to 1 for branch conditions
output logic [31:0]alu_out;   // 32-bit ALU result
input logic [31:0]rs1_data,rs2_data; // 32-bit input operands from registers

logic [63:0]alu_bus;          // 64-bit bus to hold multiplication results
       wire signed [31:0]rss1_data,rss2_data; // variables for signed of input operands

// Assign signed values to input operands for signed operations
assign rss1_data = signed'(rs1_data);
assign rss2_data = signed'(rs2_data);

always_comb
begin
zero = 0;      // Default zero flag to 0
alu_out = 0;   // Default ALU output to 0

always_comb
begin

zero = 0;
alu_out = 0;
case(alu_control)
       4'b0000:   //R-Type  //add + load + store + addi //Mul 
       begin
       if(fn7_1)
       case(fn3)
       3'b000:
       begin
       alu_bus = (rss1_data*rss2_data);//mul
       alu_out = alu_bus[31:0];
       end
       3'b001:
       begin
       alu_bus = (rss1_data*rss2_data);//mulh
       alu_out = alu_bus[63:32];
       end 
       3'b010:
       begin
       alu_bus = (rss1_data*rs2_data);//mulhsu
       alu_out = alu_bus[63:32];
       end
       3'b011:
       begin
       alu_bus = (rs1_data*rs2_data);//mulhu
       alu_out = alu_bus[63:32];
       end
       
       3'b100:
       begin
       if(rss2_data == 0)
        $error("division by zero");
       else
       alu_out = rss1_data/rss2_data;//signed
       end
       
       3'b101:
       begin
       if(rs2_data == 0)
        $error("division by zero");
       else
       alu_out = rs1_data/rs2_data;//unsigned
       end
       
       3'b110:
       alu_out = rss1_data%rss2_data;//signed
       3'b111:
       alu_out = rs1_data%rs2_data;//unsigned
       endcase
       
       
       else 
       alu_out = rss1_data + rss2_data; // add
       end
       
       4'b0001: //sub 
       alu_out = rss1_data - rss2_data;
       
       4'b0010: // xor + xori
       alu_out = rss1_data ^ rss2_data;
       
       4'b0011: //or + ori
       alu_out = rss1_data|rss2_data;
       
       4'b0100: //and + andi
       alu_out = rss1_data&rss2_data;
       
       4'b0101: //sll + slli
       alu_out = rss1_data<<rss2_data;
       
       4'b0110: //srl + srli
       alu_out = rss1_data>>rss2_data;
       
       4'b0111: //sra + srai
       alu_out = rss1_data >>> rss2_data;
       
       4'b1000: //slt + slti
       begin
       if(rss1_data<rss2_data)
       alu_out = {32{1'b1}};
       else 
       alu_out = {32{1'b0}};
       end
       
       4'b1001: //sltu + sltiu
       begin
       if(rs1_data<rs2_data)
       alu_out = {32{1'b1}};
       else 
       alu_out = {32{1'b0}};
       end
       
       4'b1010: //beq
       begin
       if(rss1_data == rss2_data)
       zero = 1;
       else
       zero = 0;
       end
       
       4'b1011: //bne
       begin
       if(rss1_data != rss2_data)
       zero = 1;
       else
       zero = 0;
       end
       
       4'b1100: //blt
       begin
       if(rss1_data<rss2_data)
       zero =  1;
       else
       zero = 0;
       end
       
       4'b1101: //bge
       begin
       if(rss1_data>rss2_data|rss1_data == rss2_data)
       zero = 1;
       else
       zero = 0;
       end       
       
       4'b1110: //bltu
       begin
       if(rs1_data<rs2_data)
       zero = 1;
       else
       zero = 0;
       end      
       
       4'b1111: //bgeu
       begin
       if(rs1_data>rs2_data)
       zero = 1;
       else
       zero = 0;
       end       
       
endcase
end
endmodule
