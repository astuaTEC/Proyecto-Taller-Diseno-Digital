

module ALUDecoder (input logic ALUOp,
						 input logic [4:0] Funct,
						 output logic NoWrite,
						 output logic [1:0] FlagW,
						 output logic [2:0] ALUControl);

	always @(*)
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1]) 
				4'b0100: ALUControl = 3'b000; // ADD
				4'b0010: ALUControl = 3'b001; // SUB
				4'b0000: ALUControl = 3'b010; // AND
				4'b1100: ALUControl = 3'b011; // ORR
				4'b1010: if (Funct[0]) ALUControl = 3'b001; //CMP
							else ALUControl = 3'bx;
				4'b1101: ALUControl = 3'b100; // MOV			
				default: ALUControl = 3'bx;  // unimplemented
			endcase
			
			// update flags if S bit is set 
			// (C & V only updated for arith instructions)
			FlagW[1] = Funct[0]; // FlagW[1] = S-bit
			
			// FlagW[0] = S-bit & (ADD | SUB)
			FlagW[0] = Funct[0] & (ALUControl == 3'b000 | ALUControl == 3'b001);
			
			NoWrite = (Funct[4:1] == 4'b1010); //CMP Flag
			
		end else begin
			ALUControl = 3'b000; // add for non-DP instructions
			FlagW = 2'b00; // don't update Flags
			NoWrite = 1'b0; //CMP Flag
		end
	 
endmodule 