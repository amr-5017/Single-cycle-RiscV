module imm_generator(imm_input, imm_output, opcode, imm_input_uj);
  input logic [11:0] imm_input;       // 12-bit input for immediate values (used in I-type, S-type, and B-type instructions).
  input logic [6:0] opcode;           // 7-bit opcode input to determine instruction type.
  output logic [31:0] imm_output;     // 32-bit output for the generated immediate value.
  input logic [19:0] imm_input_uj;    // 20-bit input for immediate values (used in J-type and U-type instructions).
always_comb  
begin  
    imm_output = 0;  
    case(opcode)  
    7'b1100011: // B-Type (Branch Instructions)  
        imm_output = {{20{imm_input[11]}}, imm_input} << 1;     // Sign-extends the 12-bit immediate to 32-bit.The upper 20 bits are filled with the sign bit (imm_input[11]).The immediate is shifted left by 1 to align with instruction encoding.

    7'b1101111: // J-Type (Jump and Link Instructions)  
        imm_output = {{12{imm_input_uj[19]}}, imm_input_uj} << 1;        // Sign-extends the 20-bit immediate to 32-bit.The upper 12 bits are filled with the sign bit (imm_input_uj[19]).The immediate is shifted left by 1 (as required by J-type encoding).

    7'b0110111: // U-Type (LUI Instruction)  
      imm_output = {{imm_input_uj}, 12'b0};  //The 20-bit immediate is left-shifted by 12 bits to form a 32-bit value.No sign extension is needed because LUI directly loads the upper 20 bits.

    default:  
    begin  
        imm_output = {{20{imm_input[11]}}, imm_input}; // Default case for other instructions (typically I-Type).Sign-extends the 12-bit immediate to 32-bit.
    end  
    endcase  
end  
endmodule  
