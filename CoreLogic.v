module CoreLogic (
	
	input CLK,
//	input CLK_sync,	//This is optional, remove if you do not need it.
	input rst_n,
	output [5:0] ControlSignal  //Do NOT modify this signal!

);
	wire [3:0] Setting;
	wire [3:0] Q;	
	wire [1:0] State;  // 00=Red, 01=Amber1, 10=Green, 11=Amber2
	
//   wire zero_flag;   
//   assign zero_flag = ~(Q[0]|Q[1]|Q[2]|Q[3]); 

	wire is_ten   = Q[3]&(~Q[2])&Q[1]&(~Q[0])&(~State[0]);
	wire is_three = (~Q[3])&(~Q[2])&Q[1]&Q[0]&State[0];	
	wire flip_en = is_ten|is_three;
	//State shifts：00→01→10→11→00
   wire J0, K0, J1, K1;
   assign J0 = flip_en&(~State[0]);
   assign K0 = flip_en&  State[0];
   assign J1 = flip_en&  State[0]& (~State[1]);
   assign K1 = flip_en&  State[0]&   State[1];

   JKTypeFF state_ff0 (CLK, rst_n, J0, K0, State[0]); //state[0] determine whether amber light is on
   JKTypeFF state_ff1 (CLK, rst_n, J1, K1, State[1]); //state[1]
	
	//State[0]==1:Setting=0011,State[0]==0:Setting=1010
	assign Setting[0] = State[0];
	assign Setting[1] = 1'b1;
	assign Setting[2] = 1'b0;
	assign Setting[3] = ~State[0];
	CounterUnit cu(CLK,Setting,rst_n,Q);
	//0-3:Q ; 4-5:state
	assign ControlSignal[0] = Q[0];
	assign ControlSignal[1] = Q[1];
	assign ControlSignal[2] = Q[2];
	assign ControlSignal[3] = Q[3];
	assign ControlSignal[4] = State[0];
	assign ControlSignal[5] = State[1];
	
endmodule