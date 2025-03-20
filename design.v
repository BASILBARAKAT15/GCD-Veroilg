module Main_Diesign (
    input [4:0] number1,
    input [4:0] number2,
    input CLK,
    input Reset,
    input S,
    output [3:0] Digit0,
    output [3:0] Digit1
);

    wire [4:0] GSD_w;

    // تعريف وحدة ASM
    ASM asm_inst (
        .number1(number1),
        .number2(number2),
        .CLK(CLK),
        .Reset(Reset),
        .S(S),
        .GSD(GSD_w)
    );

    // تعريف وحدة BineryTOBCD
    BineryTOBCD bin2bcd_inst (
        .Data(GSD_w),
        .Digit0(Digit0),
        .Digit1(Digit1)
    );

endmodule
