

module Processor(input clk, rst,
					  input [7:0] bytePos,
					  input [2:0] btn,
					  output [6:0] hex1, hex2);

  logic [31:0] Instr, ReadData, ALUResult, WriteData, binCont;
  logic [15:0] PC, mwAdress, outAdress;
  logic [7:0] ReadDataTmp, mwData, outData;
  logic MemWrite, wren, EnRAM, EnReg, S;
  logic [11:0] bcd;
  
  romtest Rom(PC, !clk, clk, Instr);
  
  RAM Ram(outAdress, !clk, outData, EnRAM | wren, ReadDataTmp);
  
  CPU cpu(clk, rst, Instr, ReadData, WriteData, ALUResult, MemWrite, PC);
  
  writeMem	wm(bytePos, btn, wren, mwAdress, mwData);
  
  // se crean 2 mux para saber si es el procesador o el modulo writeMem
  // quien escribe en la RAM
  Mux_2_to_1 #(16) muxAdressRam(wren, ALUResult[15:0], mwAdress, outAdress);
  
  Mux_2_to_1 #(8) muxDataRam(wren, WriteData[7:0], mwData, outData);
  
  //se agrega el chipset
  Chipset chipset(ALUResult, MemWrite, EnRAM, EnReg, S);
  
  //se agrega el registro que se conecta al display
  Register #(32) displayRegister(clk, rst, EnReg, WriteData, binCont);
  
  
  //se hace la decodificacion para 
  // que el resultado del MUX se muestre
  // en los display
  bin2bcd bcd_deco(binCont[7:0], bcd);
  segment7_deco seg1(bcd[3:0], hex1),
					 seg2(bcd[7:4], hex2);
  
  //Se le extiende el signo a la salida de ReadDataTmp para
  // que se adapte a la entrada ReadData de 32 bits
  assign ReadData = {{24{ReadDataTmp[7]}}, ReadDataTmp};

endmodule
