module test;

reg [31:0] A;
reg [31:0] B;
reg [3:0] ALU_Sel;

wire [31:0] ALU_Out;
wire Zero;

alu32 uut(
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Zero(Zero)
);

initial
begin

    A=20; B=10; ALU_Sel=4'b0000;
    #10;
    $display("ADD = %d", ALU_Out);

    A=20; B=5; ALU_Sel=4'b0001;
    #10;
    $display("SUB = %d", ALU_Out);

    A=15; B=9; ALU_Sel=4'b0010;
    #10;
    $display("AND = %d", ALU_Out);

    A=15; B=9; ALU_Sel=4'b0011;
    #10;
    $display("OR = %d", ALU_Out);

    A=15; B=9; ALU_Sel=4'b0100;
    #10;
    $display("XOR = %d", ALU_Out);

    A=8; ALU_Sel=4'b0110;
    #10;
    $display("SHIFT LEFT = %d", ALU_Out);

    A=8; ALU_Sel=4'b0111;
    #10;
    $display("SHIFT RIGHT = %d", ALU_Out);

    A=25; B=20; ALU_Sel=4'b1000;
    #10;
    $display("COMPARE = %d", ALU_Out);

end

endmodule