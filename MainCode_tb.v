`timescale 1ns/1ps
module MainCode_tb;
	reg CLK_50MHz;
	reg rst_n;
	wire [6:0] HexH;
	wire [6:0] HexL;
	wire Green;
	wire Red;
	wire Amber;
	MainCode uut(CLK_50MHz, rst_n, HexH, HexL, Green, Red, Amber);
	always
	begin
		#10
		CLK_50MHz = ~CLK_50MHz;
	end
	initial begin
		CLK_50MHz=0; 
		rst_n=0;
		#100
		rst_n=1;
		#2000000000
		$stop;
	end
endmodule