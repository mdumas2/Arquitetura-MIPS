`timescale 1ns/10ps
module  multiplicador_TB();

	reg clock,rst,start;
	reg [15:0] multiplicador2,multiplicando;
	wire [31:0] produto;
	wire Idle, Done;
	
	
	multiplicador DUT (
		.clock(clock),
		.rst(rst),
		.start(start),
		.Idle(Idle), 
		.Done(Done),
		.multiplicador2(multiplicador2),
		.multiplicando(multiplicando),
		.produto(produto)
	);
		

	initial begin
		forever #5 clock = ~clock;
	end
	
	initial begin
		clock = 0;
		start  = 0;
		rst = 1;
		multiplicador2 = 0;
		multiplicando = 0;
		#20;
		rst = 0;
		#20
		multiplicador2 = 2001;
		multiplicando = 4001;
		#20;
		start = 1;
		#335;
		multiplicador2 = 22;
		multiplicando = 47;
	end
	
	initial begin
		#1200 $stop;
	end
	
endmodule 
	  
