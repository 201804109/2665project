module MainCode (

	input CLK_50MHz,
	input rst_n,
	output [6:0] HexH,
	output [6:0] HexL,
	output Green,
	output Red,
	output Amber
	
);
	wire CLK_1Hz;
	ClockDivider cd(CLK_50MHz,rst_n,CLK_1Hz);
	
	wire [5:0] ControlSignal;
	CoreLogic cl(CLK_1Hz,rst_n,ControlSignal);
	
	wire [3:0] Count;
	Decoder d(ControlSignal,Count,Green,Red,Amber);
	
	SevenSegDisplay ssd(Count,HexH,HexL);
endmodule