//Note: You MUST Build the CoreLogic Module using this submodule
//Note: This CounterUnit MUST count upwards!

module CounterUnit (
	
	input CLK,
	input [3:0] Setting,
	input rst_n,
	output [3:0] Count

);
	wire [3:0]Q;
	wire reset;
	wire [3:0]S;
	wire [3:0]C;
	wire Flip;

   OneBitFullAdder fa0 (Q[0], ~Setting[0], 1'b0,  S[0], C[0]);
   OneBitFullAdder fa1 (Q[1], ~Setting[1], C[0],  S[1], C[1]);
   OneBitFullAdder fa2 (Q[2], ~Setting[2], C[1],  S[2], C[2]);
   OneBitFullAdder fa3 (Q[3], ~Setting[3], C[2],  S[3], C[3]); 	
	assign Flip = (C[3])|(~(S[0]|S[1]|S[2]|S[3]));
	assign reset = rst_n&(~Flip);
	
   wire en1;
	wire en2;
	wire en3;
   assign en1 = Q[0];
   assign en2 = Q[0]&Q[1];
   assign en3 = Q[0]&Q[1]&Q[2];

   DtypeFF d0 (CLK, 1'b1, ~Q[0], reset, Q[0]);
   DtypeFF d1 (CLK, en1,  ~Q[1], reset, Q[1]);
   DtypeFF d2 (CLK, en2,  ~Q[2], reset, Q[2]);
   DtypeFF d3 (CLK, en3,  ~Q[3], reset, Q[3]);
	
	assign Count = Q;
endmodule