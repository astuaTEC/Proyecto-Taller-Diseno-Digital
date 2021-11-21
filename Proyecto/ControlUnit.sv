
/*
*	Módulo para la Unidad de control del procesador
*/

module ControlUnit(input logic clk, rst,
						 input logic [3:0] Rd,
						 input logic [1:0] Op,
						 input logic [5:0] Funct,
						 input logic [3:0] Cond, ALUFlags,
						 output logic MemtoReg, ALUSrc, MemWrite, RegWrite, PCSrc,
						 output logic [1:0] ImmSrc, RegSrc,
						 output logic [2:0] ALUControl);

	logic [1:0] FlagW;
	logic PCS, RegW, MemW, NoWrite;
	
	Decoder CUDecoder(Rd, Op, Funct, PCS, RegW, MemW, MemtoReg, ALUSrc, 
							NoWrite, ImmSrc, FlagW, RegSrc, ALUControl);
								  
	ConditionalLogic CLogic(clk, rst, PCS, RegW, MemW, NoWrite, FlagW,
									Cond, ALUFlags, PCSrc, RegWrite, MemWrite);
						  
						  
endmodule 