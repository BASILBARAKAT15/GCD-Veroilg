module TB_MainDesign;

    reg [4:0] number1 = 5'b00000;
    reg [4:0] number2 = 5'b00000;
    reg CLK = 0;
    reg Reset = 0;
    reg S = 0;
    wire [3:0] Digit0;
    wire [3:0] Digit1;

    // استدعاء وحدة التصميم
    Main_Diesign uut (
        .number1(number1),
        .number2(number2),
        .CLK(CLK),
        .Reset(Reset),
        .S(S),
        .Digit0(Digit0),
        .Digit1(Digit1)
    );

    always #5 CLK = ~CLK;  // توليد إشارة الساعة بفترة 10ns

    initial begin
        Reset = 1;
        #10 Reset = 0;
        #10 Reset = 1;

        number1 = 5'b01010;  // 10
        number2 = 5'b00101;  // 5
        S = 1;

        #50;
        $stop;
    end

endmodule
