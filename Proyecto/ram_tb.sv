`timescale 1 ns / 1 ns
module ram_tb();


	logic [15:0] Addr;
	logic [7:0] q, data;
	logic clk, wren;

	always begin
			clk = 0; # 5; clk = 1; # 5;
	end
	 
	RAM Ram(Addr, !clk, data, wren, q);

	initial begin

	wren = 0;
	data = 0;
	
	Addr = 16'd0;
	#7;
	Addr = 16'h3;
	#10;
	Addr = 16'h9;
	#10;
	Addr = 16'hc;
	#10;


	end

endmodule 