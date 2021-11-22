`timescale 1 ns / 1 ns
module romtb();


	logic [15:0] Addr;
	logic [31:0] q;
	logic clk;

	always begin
			clk = 0; # 5; clk = 1; # 5;
	end
	 
	romtest Rom(Addr, !clk, clk, q);

	initial begin

	Addr = 16'd0;
	#7;
	Addr = 16'h14;
	#10;
	Addr = 16'h24;
	#10;
	Addr = 16'h4c;
	#10;


	end

endmodule 