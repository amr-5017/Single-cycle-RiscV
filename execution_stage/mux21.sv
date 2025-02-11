module mux21 
(
    input logic [31:0] a, b,
    input logic control,
    output logic [31:0] y
);

    assign y = control ? b : a;  //This mux is used to select between the rs2 register data and the immediatae value where the control signal comes from control unit

endmodule
