

module ControlUnit_tb();

	logic clk, rst;
	logic [3:0] Rd;
	logic [1:0] Op;
	logic [5:0] Funct;
	logic [3:0] Cond, ALUFlags;
	logic MemtoReg, ALUSrc, MemWrite, RegWrite, PCSrc;
	logic [1:0] ImmSrc, RegSrc, ALUControl;


	ControlUnit CU(clk, rst, Rd, Op, Funct, Cond, ALUFlags, MemtoReg,
						ALUSrc, MemWrite, RegWrite, PCSrc,
						ImmSrc, RegSrc, ALUControl);
					  
	initial begin

	rst = 0;
	clk = 0;
	#10;
	rst = 1;
	#10;
	rst = 0;
	 
	//Test DP Reg NO Flags
	Rd = 4'b0000;
	Op = 2'b00;
	Funct = 6'b001000;
	Cond = 4'b1110;
	ALUFlags = 4'b0000;
	#10;
	
	//Test DP Imm NO Flags
	Funct = 6'b101000;
	#10;
	
	
	//Test STR
	Op = 2'b01;
	Funct = 6'b000000;
	#10;
	
	//Test LDR
	Funct = 6'b000001;
	#10;
	
	
	//Test B
	Op = 2'b10;
	Funct = 6'b100001;
	#10;
	
	
	//Test ADDS
	Op = 2'b00;
	Funct = 6'b001001;
	Cond = 4'b0000;
	ALUFlags = 4'b0100;
	#10;
	
	ALUFlags = 4'b0000;
	#10;

	end 

	always 
		#5 clk = !clk;

endmodule 