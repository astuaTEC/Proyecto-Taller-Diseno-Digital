
/*
* Modulo mux de 16 entradas a 1 salida
*/
module Mux_16_to_1 #(parameter N = 8) (input  [3:0]   S,
													input  [N-1:0] D00, D01, D02, D03, D04, D05, D06, D07,
													input  [N-1:0] D08, D09, D10, D11, D12, D13, D14, D15,
													output logic [N-1:0] out);

							
	always_comb begin
		case(S)
			4'b0000: out = D00;
			4'b0001: out = D01;
			4'b0010: out = D02;
			4'b0011: out = D03;
			4'b0100: out = D04;
			4'b0101: out = D05;
			4'b0110: out = D06;
			4'b0111: out = D07;
			4'b1000: out = D08;
			4'b1001: out = D09;
			4'b1010: out = D10; 
			4'b1011: out = D11;
			4'b1100: out = D12;
			4'b1101: out = D13;
			4'b1110: out = D14;
			4'b1111: out = D15;
			default: out = 0;
		endcase
	end


endmodule	