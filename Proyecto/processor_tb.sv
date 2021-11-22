`timescale 1 ns/1 ns
module processor_tb();

	logic clk, rst;
	logic [7:0] bytePos;
	logic [2:0] btn;
	logic [31:0] WriteData;
	logic [7:0] outData;

	Processor procesor(clk, rst, bytePos, btn, WriteData, outData);
	
	// generate clock to sequence tests
  always begin
      clk = 1; # 5; clk = 0; # 5;
  end
  
  initial begin
		rst = 1;
		//bytePos = 0;
		btn = 0;
		#25
		
		rst = 0;
		/*bytePos = 50;
		btn = 3'b100;
		#10
		
		btn = 0;
		bytePos = 0;
		#10
		
		btn = 1;
		#10
		
		btn = 2;
		#10
		
		btn = 0;*/
			
  end

endmodule 