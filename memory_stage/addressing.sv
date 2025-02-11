module addressing(fn3, out, mem_read, mem_write);
input logic [2:0] fn3;  // 3-bit input function code (fn3) to determine access size
output logic [1:0] out; // 2-bit output that represents memory access size (byte, half-word, or word)
input logic mem_read, mem_write; // Control signals indicating memory read/write operations

always_comb  // Combinational logic block (executed whenever inputs change)
begin
    out = 2'b00;  // Default output is 2'b00 (no memory access)

    if (mem_read | mem_write) // Check if either read or write operation is active
    begin
        case (fn3) // Determine memory access size based on fn3 value
            3'b000:  // Load/store byte
                out = 2'b01; // Set output to indicate byte access
            
            3'b001:  // Load/store half-word
                out = 2'b10; // Set output to indicate half-word access
            
            3'b010:  // Load/store word
                out = 2'b11; // Set output to indicate word access
            
            default:  
                out = 2'b00; // Default case (shouldn't normally happen)
        endcase
    end
end
endmodule

