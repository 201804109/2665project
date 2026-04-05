module DtypeFF(
    input clk,
    input en,
    input D,
    input rst_n,
    output reg Q
);

    always @ (posedge clk or negedge rst_n) begin
	
        if(!rst_n)begin	
            Q = 1'b0;
        end else if(en) begin
            Q = D;
        end
	
    end
	
endmodule
