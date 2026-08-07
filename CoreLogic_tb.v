`timescale 1ms/1us

module CoreLogic_tb;

    reg  CLK;
    reg  rst_n;
    wire [5:0] ControlSignal;

    wire [1:0] State;
    wire [3:0] Q;
    assign State = uut.State;
    assign Q     = uut.Q;

    CoreLogic uut (
        CLK,
        rst_n,
        ControlSignal
    );

    initial CLK = 0;
    always #500 CLK = ~CLK;

    always @(posedge CLK) begin
        $display("Time=%0t | State=%b | Q=%d | CS=%b",
                 $time, State, Q, ControlSignal);
    end

    initial begin
        rst_n = 0;
        #1000;
        rst_n = 1;

        #60000;
        $stop;
    end

endmodule