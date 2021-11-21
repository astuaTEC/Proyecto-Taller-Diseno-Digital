

module DataPath (input logic clk, rst, MemtoReg, ALUSrc, MemWrite, RegWrite, PCSrc,
					  input logic [1:0] ImmSrc, RegSrc,
					  input logic [2:0] ALUControl,
					  input logic [31:0] Instr, ReadData, 
					  output logic [3:0] ALUFlags,
					  output logic [31:0] ALUResult, WriteData,
					  output logic [15:0] PC);

	// Conexiones internas
	logic [31:0] Result, RD1, RD2, ExtImm, SrcB, PCPlus8E;
	logic [3:0] RA1, RA2, ALUInternOp;
	
	//Conexiones memoria de instrucciones
	logic [15:0] PCPlus4, PC1, PCPlus8;
	
	//Parte relacionada al PC
	Mux_2_to_1 #(16) PCSrcMux(PCSrc, PCPlus4, Result[15:0], PC1);
	PC #(16) PCReg(clk, rst, PC1, PC);
	
	//Dos sumadores de +4
	Plus4 #(16) PCAdder1(PC, PCPlus4); 
	Plus4 #(16) PCAdder2(PCPlus4, PCPlus8);
	
	
	//Mux's en la salida de la memoria de instrucciones
	Mux_2_to_1 #(4) ra1mux(RegSrc[0], Instr[19:16], 4'b1111, RA1);
	Mux_2_to_1 #(4) ra2mux(RegSrc[1], Instr[3:0], Instr[15:12], RA2);
	
	//se conecta el banco de registros
	RegisterFile #(32) RegFile(clk, rst, RegWrite, RA1, RA2, Instr[15:12], Result, PCPlus8E, RD1, RD2);
	
	//se conecta el modulo de extension
	Extend Ext(Instr[23:0], ImmSrc, ExtImm);
	
	//Mux a la salida del banco de registros
	Mux_2_to_1 #(32) SrcBMux(ALUSrc, RD2, ExtImm, SrcB);
	
	//se  conecta la ALU
	ALUControlDeco AluDeco(ALUControl, ALUInternOp);
	ALU Alu(RD1, SrcB, ALUInternOp, ALUResult, ALUFlags);
	
	//Se conecta el mux a la salida de la RAM
	Mux_2_to_1 #(32) MemtoRegMux(MemtoReg, ALUResult, ReadData, Result);
	
	//Se le extiende el signo a la salida de PCPlus8 para
	// que se adapte al registro de 32 bits
	assign PCPlus8E = {{16{PCPlus8[15]}}, PCPlus8};
	assign WriteData = RD2;
	
endmodule 