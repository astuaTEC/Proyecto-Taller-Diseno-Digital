

module ConditionalLogic(input logic clk, rst, PCS, RegW, MemW, NoWrite,
								input logic [1:0] FlagW,
								input logic [3:0] Cond, ALUFlags,
								output logic  PCSrc, RegWrite, MemWrite);
  
  logic N, Z, C, V;
  logic CondEx;
  logic [1:0] FlagWrite;
  logic [3:0] Flags;
  
  
  Register #(2) R1(clk, rst, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
  Register #(2) R2(clk, rst, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);
  
  assign {N, Z, C, V} = Flags;
                  
  always @(*)
		case(Cond)
			4'b0000: CondEx = Z; 	// EQ
			4'b0001: CondEx = ~Z;   // NE
			4'b0010: CondEx = C;    // CS
			4'b0011: CondEx = ~C;   // CC
			4'b0100: CondEx = N;    // MI
			4'b0101: CondEx = ~N;   // PL
			4'b0110: CondEx = V;    // VS
			4'b0111: CondEx = ~V;        // VC
			4'b1000: CondEx = C & ~Z;    // HI
			4'b1001: CondEx = Z | ~C; // LS
			4'b1010: CondEx = ~(N ^ V);        // GE
			4'b1011: CondEx = N ^ V;       // LT
			4'b1100: CondEx = ~Z &  ~(N ^ V);     // GT
			4'b1101: CondEx = Z | (N ^ V);  // LE
			4'b1110: CondEx = 1'b1;        // Always
			default: CondEx = 1'bx;       // undefined
		endcase
	 
	assign FlagWrite = FlagW & {2{CondEx}};
	assign PCSrc = PCS & CondEx;
	assign RegWrite = RegW & CondEx & ~NoWrite;
	assign MemWrite = MemW & CondEx;

endmodule 