

module Processor(input  logic clk, rst);

  logic [31:0] Instr, ReadData, WriteData, ALUResult;
  logic [15:0] PC;
  logic [7:0] ReadDataTmp;
  logic MemWrite;
  
  InstructionMemory Rom(PC, clk, Instr);
  
  DataMemoryRam Ram(ALUResult, clk, WriteData, MemWrite, ReadDataTmp);
  
  CPU cpu(clk, rst, Instr, ReadData, WriteData, ALUResult, MemWrite, PC);
  
  //Se le extiende el signo a la salida de ReadDataTmp para
  // que se adapte a la entrada ReadData de 32 bits
  assign ReadData = {{24{ReadDataTmp[7]}}, ReadDataTmp};

endmodule
