

/*
* Modulo para sumar 4 a la entrada
*/
module Plus4 #(N = 8) (input logic [N-1:0] in,
							  output logic [N-1:0] out);
	
	assign out = in + 4;
	
endmodule 