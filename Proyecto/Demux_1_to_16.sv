

module Demux_1_to_16 #(parameter N = 8)(input IN, input [3:0] S,
													 output [N-1:0] OUT);

	logic [N-1:0] out = 0;
							  
	always_comb begin
		out = 0;
		case(S)
			4'b0000: out[0]  = IN;
			4'b0001: out[1]  = IN;
			4'b0010: out[2]  = IN;
			4'b0011: out[3]  = IN;
			4'b0100: out[4]  = IN;
			4'b0101: out[5]  = IN;
			4'b0110: out[6]  = IN;
			4'b0111: out[7]  = IN;
			4'b1000: out[8]  = IN;
			4'b1001: out[9]  = IN;
			4'b1010: out[10] = IN; 
			4'b1011: out[11] = IN;
			4'b1100: out[12] = IN;
			4'b1101: out[13] = IN;
			4'b1110: out[14] = IN;
			4'b1111: out[15] = IN;
			default: out = 0;
		endcase
	end

assign OUT = out;

endmodule 