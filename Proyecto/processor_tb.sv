`timescale 1 ns/1 ns
module processor_tb();

	logic clk, rst;
	logic [7:0] bytePos;
	logic [2:0] btn;
	logic [31:0] WriteData;
	logic [7:0] outData;
	logic [6:0] hex1, hex2;

	Processor processor(clk, rst, bytePos, btn, hex1, hex2);
	
	// generate clock to sequence tests
  always begin
      clk = 1; # 5; clk = 0; # 5;
  end
  
  initial begin
		rst = 1;
		//bytePos = 0;
		btn = 0;
		#25
		
		//se escribe una posicion inicial
		bytePos = 8'd10;
		btn = 3'b011;
		#25
		
		//se escoge el algoritmo 1
		btn = 3'b110;
		#25
		
		rst = 0;
		btn = 0;
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