

module Processor(input logic clk, rst,
					  input logic [7:0] bytePos,
					  input logic [2:0] btn,
					  output logic [31:0] WriteData,
					  output logic [7:0] outData);

  logic [31:0] Instr, ReadData, ALUResult;
  logic [15:0] PC, mwAdress, outAdress;
  logic [7:0] ReadDataTmp, mwData;
  logic MemWrite, wren;
  
  romtest Rom(PC, !clk, clk, Instr);
  
  RAM Ram(outAdress, !clk, outData, MemWrite | wren, ReadDataTmp);
  
  CPU cpu(clk, rst, Instr, ReadData, WriteData, ALUResult, MemWrite, PC);
  
  writeMem	wm(bytePos, btn, wren, mwAdress, mwData);
  
  // se crean 2 mux para saber si es el procesador o el modulo writeMem
  // quien escribe en la RAM
  Mux_2_to_1 #(16) muxAdressRam(wren, ALUResult[15:0], mwAdress, outAdress);
  
  Mux_2_to_1 #(8) muxDataRam(wren, WriteData[7:0], mwData, outData);
  
  //Se le extiende el signo a la salida de ReadDataTmp para
  // que se adapte a la entrada ReadData de 32 bits
  assign ReadData = {{24{ReadDataTmp[7]}}, ReadDataTmp};

endmodule
