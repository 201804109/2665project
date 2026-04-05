module Comparator (
    input  [24:0] Q,
    output Flip
);
    wire [24:0] S;
    wire [24:0] C;
    // Q - 24999999
    // 24999999 = 25'b1011111010111100000111111	 
	 
	 OneBitFullAdder fa0  (Q[0],  1'b0, 1'b1, S[0],  C[0]);
    OneBitFullAdder fa1  (Q[1],  1'b0, C[0], S[1],  C[1]);
    OneBitFullAdder fa2  (Q[2],  1'b0, C[1], S[2],  C[2]);
    OneBitFullAdder fa3  (Q[3],  1'b0, C[2], S[3],  C[3]);
    OneBitFullAdder fa4  (Q[4],  1'b0, C[3], S[4],  C[4]);
    OneBitFullAdder fa5  (Q[5],  1'b0, C[4], S[5],  C[5]);
    OneBitFullAdder fa6  (Q[6],  1'b1, C[5], S[6],  C[6]);
    OneBitFullAdder fa7  (Q[7],  1'b1, C[6], S[7],  C[7]);
    OneBitFullAdder fa8  (Q[8],  1'b1, C[7], S[8],  C[8]);
    OneBitFullAdder fa9  (Q[9],  1'b1, C[8], S[9],  C[9]);
    OneBitFullAdder fa10 (Q[10], 1'b1, C[9], S[10], C[10]);
    OneBitFullAdder fa11 (Q[11], 1'b0, C[10], S[11], C[11]);
    OneBitFullAdder fa12 (Q[12], 1'b0, C[11], S[12], C[12]);
    OneBitFullAdder fa13 (Q[13], 1'b0, C[12], S[13], C[13]);
    OneBitFullAdder fa14 (Q[14], 1'b0, C[13], S[14], C[14]);
    OneBitFullAdder fa15 (Q[15], 1'b1, C[14], S[15], C[15]);
    OneBitFullAdder fa16 (Q[16], 1'b0, C[15], S[16], C[16]);
    OneBitFullAdder fa17 (Q[17], 1'b1, C[16], S[17], C[17]);
    OneBitFullAdder fa18 (Q[18], 1'b0, C[17], S[18], C[18]);
    OneBitFullAdder fa19 (Q[19], 1'b0, C[18], S[19], C[19]);
    OneBitFullAdder fa20 (Q[20], 1'b0, C[19], S[20], C[20]);
    OneBitFullAdder fa21 (Q[21], 1'b0, C[20], S[21], C[21]);
    OneBitFullAdder fa22 (Q[22], 1'b0, C[21], S[22], C[22]);
    OneBitFullAdder fa23 (Q[23], 1'b1, C[22], S[23], C[23]);
    OneBitFullAdder fa24 (Q[24], 1'b0, C[23], S[24], C[24]);
	 //assign Flip = S[24];
	 assign Flip = (~S[24])&(~S[23])&(~S[22])&(~S[21])&(~S[20])&(~S[19])&(~S[18])&(~S[17])&(~S[16])&(~S[15])&(~S[14])&(~S[13])&(~S[12])&(~S[11])&(~S[10])&(~S[9])&(~S[8])&(~S[7])&(~S[6])&(~S[5])&(~S[4])&(~S[3])&(~S[2])&(~S[1])&(~S[0]);
endmodule