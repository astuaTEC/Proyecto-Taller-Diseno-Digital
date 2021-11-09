

module Alu_tb();

	logic [31:0] a, b, res;
	logic [3:0] ctrl, flags;
	
	ALU alu(a, b, ctrl, res, flags);
	
	initial begin
	
		a = 15;
		b = 7;
		ctrl = 4'b0010;
		#10
		
		a = 1;
		b = 30;
		
	
	end

endmodule 