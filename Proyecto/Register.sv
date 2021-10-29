

/*
* Modulo de los regiustros del procesador
*/
module Register #(parameter N = 8)(input clk, rst, en, 
											  input [N-1:0] D,
											  output logic [N-1:0] Q);
	
	always_ff @(negedge clk or posedge rst) begin
		if (rst) Q = 0;
		else if (en) Q = D;
	end
	
endmodule 