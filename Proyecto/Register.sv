

module Register #(parameter N = 8)(input clk, rst, 
											  input [N-1:0] D,
											  output logic [N-1:0] Q);
	always_ff @(posedge clk or posedge rst)
		if (rst) Q = 0;
		else
			Q = D;
		
endmodule 