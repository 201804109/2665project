`timescale 1ns/1ps
module Decoder_tb;

    reg [5:0] ControlSignal;
    wire [3:0] Count;
    wire Green;
    wire Red;
    wire Amber;

    Decoder uut (
        ControlSignal,
        Count,
        Green,
        Red,
        Amber
    );

   initial begin
       ControlSignal = 6'b000000;

      #10 ControlSignal = 6'b000000; // 0
      #10 ControlSignal = 6'b000001; // 1
      #10 ControlSignal = 6'b000010; // 2
      #10 ControlSignal = 6'b000011; // 3
      #10 ControlSignal = 6'b000100; // 4
      #10 ControlSignal = 6'b000101; // 5
      #10 ControlSignal = 6'b000110; // 6
      #10 ControlSignal = 6'b000111; // 7
      #10 ControlSignal = 6'b001000; // 8
      #10 ControlSignal = 6'b001001; // 9
      #10 ControlSignal = 6'b001010; // 10
      #10 ControlSignal = 6'b010000; // 0
      #10 ControlSignal = 6'b010001; // 1
      #10 ControlSignal = 6'b010010; // 2
      #10 ControlSignal = 6'b010011; // 3
      #10 ControlSignal = 6'b100000; // 0
      #10 ControlSignal = 6'b100001; // 1
      #10 ControlSignal = 6'b100010; // 2
      #10 ControlSignal = 6'b100011; // 3
      #10 ControlSignal = 6'b100100; // 4
      #10 ControlSignal = 6'b100101; // 5
      #10 ControlSignal = 6'b100110; // 6
      #10 ControlSignal = 6'b100111; // 7
      #10 ControlSignal = 6'b101000; // 8
      #10 ControlSignal = 6'b101001; // 9
      #10 ControlSignal = 6'b101010; // 10
		#10 ControlSignal = 6'b110000; // 0
      #10 ControlSignal = 6'b110001; // 1
      #10 ControlSignal = 6'b110010; // 2
      #10 ControlSignal = 6'b110011; // 3
		#10
		$stop;
   end

endmodule