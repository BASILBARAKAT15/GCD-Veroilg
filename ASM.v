module ASM (
    input [4:0] number1,
    input [4:0] number2,
    input CLK,
    input Reset,
    input S,
    output reg [4:0] GSD
);

    reg [4:0] A, B, R;
    typedef enum reg [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} state_type;
    state_type current_state, next_state;

    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            current_state <= S0;
            A <= 0;
            B <= 0;
            R <= 0;
            GSD <= 0;
        end else begin
            case (current_state)
                S2: begin
                    A <= number1;
                    B <= number2;
                    R <= 0;
                end
                S4: begin
                    R <= A % B;
                end
            endcase
            current_state <= next_state;
        end
    end

endmodule
