`timescale 1ns/1ps
module ClockDivider_tb;

    reg CLK_50MHz;
    reg rst_n;
    wire CLK_1Hz;
	 wire [24:0] Q_out;
	 wire Flip_out, reset_out;
    // DUT
    ClockDivider uut (
        CLK_50MHz,
        rst_n,
        CLK_1Hz
//		  Q_out,
//		  Flip_out,
//		  reset_out
    );

    // 50 MHz clock
    initial begin
        CLK_50MHz = 1'b0;
    end

    always begin 
		 #10;
		 CLK_50MHz = ~CLK_50MHz;
	 end
    initial begin
        rst_n = 1'b0;
        #100;
        rst_n = 1'b1;

        #2000000000;   
        $stop;
    end

endmodule