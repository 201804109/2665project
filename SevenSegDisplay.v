module SevenSegDisplay(

	input [3:0] Count,
	output [6:0] SevenSegH,
	output [6:0] SevenSegL

);
   wire tens;  
   wire a;
	wire b;
	wire c;
	wire d;	
	
	assign tens = Count[3]&(Count[2]|Count[1]);  


	assign a = (Count[3]&(~tens));
 	assign b = (Count[2]&(~tens))|(Count[2]&Count[1]&tens);
	assign c = (Count[1]&(~tens))|(Count[2]&(~Count[1])&tens);
	assign d = Count[0];
	
   assign SevenSegH[0] = tens;             
   assign SevenSegH[1] = 1'b0;                 
   assign SevenSegH[2] = 1'b0;                 
   assign SevenSegH[3] = tens;             
   assign SevenSegH[4] = tens;             
   assign SevenSegH[5] = tens;             
   assign SevenSegH[6] = 1'b1;                 

   assign SevenSegL[0] = ((~a)&(~c)&(b^d));
   assign SevenSegL[1] = (b&(c^d))|(a&c&d);
   assign SevenSegL[2] = ((~b)&c&(~d))|(a&b&c);
	assign SevenSegL[3] = ((~a)&(~c)&(b^d))|(b&c&d); 
   assign SevenSegL[4] = (b&(~c))|d;
   assign SevenSegL[5] = (((~a)&(~b)&d)|((~a)&(~b)&c&(~d))|((~a)&b&c&d));
   assign SevenSegL[6] = (((~a)&(~b)&(~c))|((~a)&b&c&d));	 
endmodule