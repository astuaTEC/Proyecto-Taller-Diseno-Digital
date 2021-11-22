module Chipset(input logic [31:0] Addr,
					input logic MemWrite,
					output logic EnRAM, EnReg, S);
					
	always_comb begin
		case(Addr) 
			// Direcciones de RAM 0-0xFFFF
			32'h0, 32'hffff: begin
				EnReg = MemWrite;
				EnRAM = 0;
				S = 0;
			end
			// Dirección display 0x10000
			32'h0001_0000: begin 
				EnReg = 0;
				EnRAM = MemWrite;
				S = 1;
			end
			
			default: begin
				EnReg = 0;
				EnRAM = 0;
				S = 0; // Si se sale del rango se escoge el RAM
			end
		endcase
	end
					
endmodule  