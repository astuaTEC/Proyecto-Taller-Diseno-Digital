

/*
* Modulo para el decodificador principal
* Referencia: https://github.com/liaukovv/single_cycle/blob/master/controller/controller.v
*/
module MainDecoder(input  logic[1:0] Op,
						 input  logic Funct5, Funct0,
						 output logic Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp,
						 output logic [1:0] ImmSrc, 
						 output logic [1:0] RegSrc);
		
	reg [9:0] controls;

	// Main Decoder
	always_comb
		casex(Op)
  	             // Data processing immediate
			2'b00: if (Funct5)  controls = 10'b0001001X01;
  	             
					 // Data processing register
					 else	controls = 10'b0000XX1001; 
  	             
					 // LDR
			2'b01: if (Funct0) controls = 10'b0101011X00;
								 
  	             // STR
					 else	controls = 10'b0X11010100; 
  	            
					// B
			2'b10:	controls = 10'b1001100X10;
			
  	            // Unimplemented
			default:	controls = 10'bx;          
  	endcase

	assign Branch = controls[9];
	assign MemtoReg = controls[8];
	assign MemW = controls[7];
	assign ALUSrc = controls[6];
	assign ImmSrc = controls[5:4];
	assign RegW = controls[3];
	assign RegSrc = controls[2:1];
	assign ALUOp = controls[0];
	
	
endmodule 