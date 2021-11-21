

module ALUControlDeco (input logic [2:0] ALUControl,
							  output logic [3:0] ALUOp);

	always @(*) begin
		case (ALUControl) 
			3'b000: ALUOp = 4'b0000;
			3'b001: ALUOp = 4'b0010;
			3'b010: ALUOp = 4'b0100;
			3'b011: ALUOp = 4'b0101;
			3'b100: ALUOp = 4'b0001;
			default: ALUOp = 4'b0000;
		endcase 
	end
							  
endmodule 