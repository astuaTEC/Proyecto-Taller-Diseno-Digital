

module ALUDecoder (input logic ALUOp,
						 input logic [4:0] Funct,
						 output logic NoWrite,
						 output logic [1:0] ALUControl, FlagW);

	always_comb
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1]) 
				4'b0100: ALUControl = 2'b00; // ADD
				4'b0010: ALUControl = 2'b01; // SUB
				4'b0000: ALUControl = 2'b10; // AND
				4'b1100: ALUControl = 2'b11; // ORR
				4'b1010: if (Funct[0]) ALUControl = 2'b01; //CMP
							else ALUControl = 2'bx;
							
				default: ALUControl = 2'bx;  // unimplemented
			endcase
			
			// update flags if S bit is set 
			// (C & V only updated for arith instructions)
			FlagW[1] = Funct[0]; // FlagW[1] = S-bit
			
			// FlagW[0] = S-bit & (ADD | SUB)
			FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
			
			NoWrite = (Funct[4:1] == 4'b1010); //CMP Flag
			
		end else begin
			ALUControl = 2'b00; // add for non-DP instructions
			FlagW = 2'b00; // don't update Flags
			NoWrite = 1'b0; //CMP Flag
		end
	 
endmodule 