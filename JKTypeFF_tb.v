`timescale 1ns/1ps
module JKTypeFF_tb;
	reg clk;
	reg rst_n;
	reg J;
	reg K;
	wire Q;
	JKTypeFF uut(clk, rst_n, J, K, Q);
	always 
	begin
		#5 
		clk = ~clk;
	end
	initial begin
		clk=0; rst_n=0; J=0; K=0;
		#12
		rst_n=1;
		#10
		J=1; K=0;	
		#10
		J=0; K=1;	
		#10
		J=0; K=0;	
		#10
		J=1; K=1;	
		#10
		J=1; K=1;	
		#10
		rst_n=0;
		#10 $stop;
	end
endmodule