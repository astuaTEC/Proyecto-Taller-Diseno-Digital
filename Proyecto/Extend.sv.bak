module Extend(input  [23:0] x,
                input  [1:0]  ImmSrc,
                output reg [31:0] ExtImm);
 
always @(*)
    case(src) 
                 // 8-bit unsigned immediate
        2'b00:   ExtImm = {24'b0, x[7:0]};  
                 // 12-bit unsigned immediate 
        2'b01:   ExtImm = {20'b0, x[11:0]}; 
                 // 24-bit two's complement shifted branch 
        2'b10:   ExtImm = {{6{x[23]}}, x[23:0], 2'b00}; 
        default: ExtImm = 32'bx; // undefined
    endcase             
endmodule