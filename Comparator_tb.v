`timescale 1ns/1ps
module Comparator_tb;
	reg  [24:0] Q;
	wire Flip;
	Comparator uut(Q, Flip);
	initial begin
		Q = 25'd0;
		#10 Q = 25'd24999998;
		#10 Q = 25'd24999999;
		#10 Q = 25'd25000000;
		#10 Q = 25'h1FFFFFF;	
		#10 $stop;
	end

endmodule