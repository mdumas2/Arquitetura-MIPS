module multiplicador(clock,rst,start,Done,Idle,multiplicador2,multiplicando,produto);

	input clock,rst,start;
	input [15:0] multiplicador2,multiplicando;
	output [31:0] produto;
	output Idle, Done;
	wire k;
	wire [16:0] saida_soma;
	wire m;
	wire load,ad,sh;
	wire [15:0] entrada_soma;
	
	assign m = produto[0];
	assign entrada_soma = produto [31:16];
	
   Control_mult controle_mu(clock,rst,sh,load,start,ad,m,k,Idle,Done);
   Counter_mult counter_mu(clock,rst,k,load);
	Adder adder_mu(multiplicando,entrada_soma,saida_soma);
	ACC acc_mu(clock,rst,load,sh,ad,saida_soma,multiplicador2,produto);
	
endmodule
