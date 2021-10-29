
/*
* Modulo mux de 2 entradas a 1 salida
*/
module Mux_2_to_1 #(parameter N = 8)(input sel,
												 input [N-1:0] A, B,
												 output [N-1:0] C);
	assign C = sel ? B : A;
	
endmodule 