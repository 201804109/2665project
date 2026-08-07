module Decoder (

	input [5:0] ControlSignal,
	output [3:0] Count,			//in binary format!
	output Green,
	output Red,
	output Amber
	
);

	assign Green = (~ControlSignal[4])&( ControlSignal[5]);
	assign Red   = (~ControlSignal[4])&(~ControlSignal[5]);	
	assign Amber = ControlSignal[4];
	
	wire [3:0] limit;
	wire [3:0] S;
	wire [3:0] C;
	assign limit[0] = ControlSignal[4];
	assign limit[1] = 1'b1;	
	assign limit[2] = 1'b0;
	assign limit[3] = ~ControlSignal[4];	
	
	OneBitFullAdder obfa0 (limit[0], ~ControlSignal[0],1'b1,S[0],C[0]);
	OneBitFullAdder obfa1 (limit[1], ~ControlSignal[1],C[0],S[1],C[1]);	
	OneBitFullAdder obfa2 (limit[2], ~ControlSignal[2],C[1],S[2],C[2]);	
	OneBitFullAdder obfa3 (limit[3], ~ControlSignal[3],C[2],S[3],C[3]);		
	assign Count = S;
endmodule