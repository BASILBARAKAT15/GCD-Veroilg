module BineryTOBCD (
    input [4:0] Data,
    output reg [3:0] Digit0,
    output reg [3:0] Digit1
);

    always @(*) begin
        if (Data >= 0 && Data <= 31) begin
            Digit0 = Data % 10;
            Digit1 = Data / 10;
        end else begin
            Digit0 = 4'b0000;
            Digit1 = 4'b0000;
        end
    end

endmodule
