`timescale 1ns/1ps

module DtypeFF_tb;

    reg clk;
    reg en;
    reg D;
    reg rst_n;
    wire Q;

    DtypeFF uut(clk, en, D, rst_n, Q);
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        en = 0;
        D = 0;
        #10 rst_n = 1;   
        #10 en = 1; D = 1;
        #10 D = 0;        
        #10 en = 0; D = 1;

        #10 rst_n = 0;      

        #10 $stop;
    end

endmodule