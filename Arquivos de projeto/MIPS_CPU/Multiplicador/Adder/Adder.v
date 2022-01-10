module Adder(A,B,saida);
	input [15:0] A,B;
	output [16:0] saida;
	
	assign saida = A + B;
	
endmodule 