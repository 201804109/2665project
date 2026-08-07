`timescale 1ns/1ps
module OneBitFullAdder_tb;
	reg a;
	reg b;
	reg c_in;

	wire sum; 
	wire c_out;
	OneBitFullAdder uut(a, b, c_in, sum, c_out);
	initial begin
		a=0; b=0; c_in=0;
		#10 
		a=0; b=0; c_in=1;
		#10 
		a=0; b=1; c_in=0;
		#10 
		a=0; b=1; c_in=1;
		#10 
		a=1; b=0; c_in=1;
		#10 
		a=1; b=1; c_in=0;
		#10 
		a=1; b=1; c_in=1;
		#10 $stop; 
	end

endmodule