module alu32(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output reg [31:0] ALU_Out,
    output Zero
);

always @(*)
begin
    case(ALU_Sel)

        4'b0000: ALU_Out = A + B;
        4'b0001: ALU_Out = A - B;
        4'b0010: ALU_Out = A & B;
        4'b0011: ALU_Out = A | B;
        4'b0100: ALU_Out = A ^ B;
        4'b0101: ALU_Out = ~A;
        4'b0110: ALU_Out = A << 1;
        4'b0111: ALU_Out = A >> 1;

        4'b1000:
        begin
            if(A > B)
                ALU_Out = 1;
            else
                ALU_Out = 0;
        end

        default: ALU_Out = 0;

    endcase
end

assign Zero = (ALU_Out == 0);

endmodule