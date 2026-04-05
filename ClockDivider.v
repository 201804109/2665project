module ClockDivider (

	input CLK_50MHz, 
	input rst_n,
	output CLK_1Hz
//	output CLK_sync //This is optional, remove if you do not need it.
);
	wire [24:0]Q;
	wire  FIL;
	wire Flip;
	wire reset;
	Comparator c1(Q,Flip);
	assign reset = rst_n&(Flip);

	DtypeFF d0 (CLK_50MHz,1'b1,~Q[0],reset,Q[0]);
	DtypeFF d1(~Q[0], 1'b1, ~Q[1], reset, Q[1]);
	DtypeFF d2(~Q[1], 1'b1, ~Q[2], reset, Q[2]);
	DtypeFF d3(~Q[2], 1'b1, ~Q[3], reset, Q[3]);
	DtypeFF d4(~Q[3], 1'b1, ~Q[4], reset, Q[4]);
	DtypeFF d5(~Q[4], 1'b1, ~Q[5], reset, Q[5]);
	DtypeFF d6(~Q[5], 1'b1, ~Q[6], reset, Q[6]);
	DtypeFF d7(~Q[6], 1'b1, ~Q[7], reset, Q[7]);
	DtypeFF d8(~Q[7], 1'b1, ~Q[8], reset, Q[8]);
	DtypeFF d9(~Q[8], 1'b1, ~Q[9], reset, Q[9]);
	DtypeFF d10(~Q[9], 1'b1, ~Q[10], reset, Q[10]);
	DtypeFF d11(~Q[10],1'b1, ~Q[11], reset, Q[11]);
	DtypeFF d12(~Q[11],1'b1, ~Q[12], reset, Q[12]);
	DtypeFF d13(~Q[12],1'b1, ~Q[13], reset, Q[13]);
	DtypeFF d14(~Q[13],1'b1, ~Q[14], reset, Q[14]);
	DtypeFF d15(~Q[14],1'b1, ~Q[15], reset, Q[15]);
	DtypeFF d16(~Q[15],1'b1, ~Q[16], reset, Q[16]);
	DtypeFF d17(~Q[16],1'b1, ~Q[17], reset, Q[17]);
	DtypeFF d18(~Q[17],1'b1, ~Q[18], reset, Q[18]);
	DtypeFF d19(~Q[18],1'b1, ~Q[19], reset, Q[19]);
	DtypeFF d20(~Q[19],1'b1, ~Q[20], reset, Q[20]);
	DtypeFF d21(~Q[20],1'b1, ~Q[21], reset, Q[21]);
	DtypeFF d22(~Q[21],1'b1, ~Q[22], reset, Q[22]);
	DtypeFF d23(~Q[22],1'b1, ~Q[23], reset, Q[23]);
	DtypeFF d24(~Q[23],1'b1, ~Q[24], reset, Q[24]);

	
	JKTypeFF d(Flip,rst_n,1'b1, 1'b1, FIL);
	assign CLK_1Hz = FIL;
endmodule
