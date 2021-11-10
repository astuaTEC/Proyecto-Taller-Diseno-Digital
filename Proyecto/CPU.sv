

module CPU(input  logic clk, rst,
			  input  logic [31:0] Instr, ReadData,
           output logic [31:0] WriteData, ALUResult,
			  output logic MemWrite,
			  output logic [15:0] PC);
			  
	logic PCSrc, MemtoReg, ALUSrc, RegWrite;
	logic [3:0] ALUFlags;
	logic [1:0] ImmSrc, RegSrc, ALUControl;

	ControlUnit CU(clk, rst, Instr[15:12], Instr[27:26], Instr[25:20], Instr[31:28], ALUFlags, MemtoReg,
						ALUSrc, MemWrite, RegWrite, PCSrc,
						ImmSrc, RegSrc, ALUControl);
				  
	DataPath DP(clk, rst, MemtoReg, ALUSrc, MemWrite, RegWrite, PCSrc,
					ImmSrc, RegSrc, ALUControl,
					Instr, ReadData, ALUFlags,
					ALUResult, WriteData, PC);
			  
endmodule 