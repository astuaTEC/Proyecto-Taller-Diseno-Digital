
/*
* Modulo para escribir algo en memoria dependiendo
* de la entrada escogida
*/
module writeMem(input logic [7:0] bytePos, input logic [2:0] btn,
					 output logic enable,
					 output logic [15:0] addr,
					 output logic [7:0] data);
	
	always @(btn) begin
		case(btn)
			//algoritmo 1
			3'b110: begin
				//escribe en la pos 0 un 1
				enable = 1'b1;
				addr = 16'h0;
				data = 8'd1;
			end
			// algoritmo 2
			3'b101: begin
				//escribe en la pos 0 un 2
				enable = 1'b1;
				addr = 16'h0;
				data = 8'd2;
			end
			//escribir la direccion del byte en donde
			// iniciar el conteo de palabras
			3'b011: begin
				//escribe en la pos 1, la posicion donde empezar el conteo
				enable = 1'b1;
				addr = 16'h1;
				data = bytePos;
			end
			default: begin
				//no se escribe nada, el enable esta en 0
				enable = 1'b0;
				addr = 16'd0;
				data = 8'd0;
			end
		endcase
	end
					 
endmodule 