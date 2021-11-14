`timescale 1 ns / 1 ns
module romtb();


	logic [15:0] Addr;
	logic [31:0] q;
	logic clk;

	always begin
			clk = 1; # 5; clk = 0; # 5;
	end
	 
	InstructionMemory Rom(Addr, clk, q);

	initial begin

	Addr = 16'd0;
	#10;
	Addr = 16'd4;
	#10;
	Addr = 16'd2;
	#10;
	Addr = 16'd126;
	#10;


	end

endmodule 