
/*
    0000 add A + B       Addition
    0010 sub A - B       Subtraction
    0100 and A and B     Logical and 
    0101 or  A or  B     Logical or
    0110 xor A xor B     Exclusive or 
    0111 nor A nor B     Logical nor
    1010 slt (A - B)[31] Set less than
*/
// Referencia: https://github.com/liaukovv/single_cycle/blob/master/datapath/alu.v

module ALU(
    input [31:0] a, b,
    input [3:0] ctrl,
    output [31:0] res,
    output [3:0] flags // 3=negative, 2=zero, 1=carry, 0=overflow
);

	wire [31:0] ares, lres;
	wire [31:0] sumres, sb;
	wire cout;

	assign res = ctrl[2] ? lres : ares;

	//overflow
	assign o1 = ~(ctrl[1] ^ (a[31] ^ b[31]));
	assign o2 = (ares[31] ^ a[31]);
	assign o3 = ~ctrl[2];
	assign flags[0] = o1 & o2 & o3;

	//carry
	assign flags[1] = (~ctrl[2]) & cout;

	//zero
	assign flags[2] = ~(|res);

	//negative
	assign flags[3] = res[31];

	//arithmetic result
	assign sb = ctrl[1] ? ~b : b;
	assign {cout, sumres} = a + sb + ctrl[1];
	assign ares = ctrl[3] ? {31'b0, sumres[31]} : sumres;

	//logical result
	assign lres = (ctrl[2:0] == 3'b100) ? a & b    :
					  (ctrl[2:0] == 3'b101) ? a | b    :
					  (ctrl[2:0] == 3'b110) ? a ^ b    :
					  (ctrl[2:0] == 3'b111) ? ~(a | b) :
													  32'b0    ;

endmodule 