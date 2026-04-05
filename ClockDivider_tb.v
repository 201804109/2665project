`timescale 1ns/1ps
module ClockDivider_tb;

    reg CLK_50MHz;
    reg rst_n;
    wire CLK_1Hz;

    // DUT
    ClockDivider uut (
        .CLK_50MHz(CLK_50MHz),
        .rst_n(rst_n),
        .CLK_1Hz(CLK_1Hz)
    );
	 
    initial begin
        CLK_50MHz = 1'b0;
    end
    // 50 MHz clock: period = 20 ns
    always begin
        #10;
        CLK_50MHz <= ~CLK_50MHz;
    end	 
    always @(posedge uut.Flip) begin
        $display("--------------------------------------------------");
        $display("Flip rises at %0t ns", $time);
        $display("Q at Flip rise      = %b", uut.Q);
        $display("FIL at Flip rise    = %b", uut.FIL);

        #1;
        $display("Q after 1ns         = %b", uut.Q);

        #9;
        $display("Q after 10ns        = %b", uut.Q);

        #100;
        $display("Q after 110ns        = %b", uut.Q);

        if (uut.Q == 25'b0)
            $display(">>> Q has been cleared to 0");
        else
            $display(">>> Q has NOT been cleared to 0");
    end

    // stimulus
    initial begin
        rst_n = 1'b0;
        #100;
        rst_n = 1'b1;

        #2000000000;   // 2000 ms

        $stop;
    end



endmodule