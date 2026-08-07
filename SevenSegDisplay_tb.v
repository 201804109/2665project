`timescale 1ns/1ps
module SevenSegDisplay_tb;
    reg [3:0] Count;
    wire [6:0] SevenSegH, SevenSegL;

    SevenSegDisplay uut (
        Count,
        SevenSegH,
        SevenSegL
    );

    integer i;
    initial begin
        for (i = 0; i <= 15; i = i + 1) begin
            Count = i;
            #10;
            $display("Count=%0d | H=%07b L=%07b", i, SevenSegH, SevenSegL);
        end
    end
endmodule