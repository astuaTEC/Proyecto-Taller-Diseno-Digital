module Chipset(input logic [31:0] Addr,
					input logic MemWrite,
					output logic EnRAM, EnReg, S);
					
	always_comb begin
		case(Addr) 
			// Direcciones de RAM 0-0x200 (512 decimal)
			32'h0, 32'h200: begin
				EnReg = 0;
				EnRAM = MemWrite;
				S = 1;
			end
			// Dirección display 0x208 (520 decimal)	
			32'h208: begin 
				EnReg = MemWrite;
				EnRAM = 0;
				S = 0;
			end
			
			default: begin
				EnReg = 0;
				EnRAM = 0;
				S = 0; // Si se sale del rango se escoge el RAM
			end
		endcase
	end
					
endmodule  