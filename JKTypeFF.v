module JKTypeFF(
    input clk,
    input rst_n,
    input J,
    input K,
    output reg Q
);
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            Q = 1'b0;
        else begin
            case ({K,J})
                2'b00 : Q <= Q;
                2'b01 : Q <= 1'b1;
                2'b10 : Q <= 1'b0;
                2'b11 : Q <= ~Q;
            endcase
        end
    end
endmodule