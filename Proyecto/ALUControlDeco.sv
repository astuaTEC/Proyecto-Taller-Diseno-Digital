

module ALUControlDeco (input logic [1:0] ALUControl,
							  output logic [3:0] ALUOp);

	always @(*) begin
		case (ALUControl) 
			2'b00: ALUOp = 4'b0000;
			2'b01: ALUOp = 4'b0010;
			2'b10: ALUOp = 4'b0100;
			2'b11: ALUOp = 4'b0101;
			default: ALUOp = 4'b0000;
		endcase 
	end
							  
endmodule 