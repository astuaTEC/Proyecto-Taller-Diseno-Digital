

module Chipset(input logic MW, input logic [31:0] Addr,
					output logic writeRam, S);
					
	always @(*) begin
	
		case (MW) 
			//se necesita leer
			1'b0: begin
				writeRam = 1'b0;
				S = 0;
			end
			//se necesita escribir
			1'b1: begin
				writeRam = 1'b1;
				S = 1;
			end
		endcase
	end
					
endmodule  