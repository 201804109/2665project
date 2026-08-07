`timescale 1ms/1us
module CounterUnit_tb;

   reg        CLK;
   reg  [3:0] Setting;
   reg        rst_n;
   wire [3:0] Count;

   CounterUnit uut (
       CLK,
       Setting,
       rst_n,
       Count
   );

   initial CLK = 1'b0;
   always begin 
		#500 
		CLK =
		~CLK;
	 end
   initial begin
       rst_n   = 1'b0;
       Setting = 4'd0;
       #2000;
       rst_n   = 1'b1;

       Setting = 4'd5;
       #8000;   //8s

       Setting = 4'd9;
       #15000;  //15s
		  
       Setting = 4'd7;
       #5000;
       rst_n = 1'b0; 
       #2000;
       rst_n = 1'b1;  
       #8000;

       Setting = 4'd1;
       #5000;

       Setting = 4'd15;
       #20000;

       $stop;
   end

endmodule