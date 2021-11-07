
/*
*	Módulo para el decodificador de la Unidad de Control
*/

module Decoder(input  logic [3:0] Rd,
					input  logic [1:0] Op,
					input  logic [5:0] Funct,
					output logic PCS, RegW, MemW, MemtoReg, ALUSrc, NoWrite, 
					output logic [1:0] ImmSrc, FlagW, RegSrc, ALUControl);

	logic Branch, ALUOp;
	
	MainDecoder MainDeco(Op, Funct[5], Funct[0], Branch, 
								RegW, MemW, MemtoReg, ALUSrc, ALUOp,
								ImmSrc, RegSrc);
	
	ALUDecoder	ALUDeco(ALUOp, Funct[4:0], NoWrite, ALUControl, FlagW);
	
	PC_Logic PcLogic(Rd, Branch, RegW, PCS);
					
endmodule 