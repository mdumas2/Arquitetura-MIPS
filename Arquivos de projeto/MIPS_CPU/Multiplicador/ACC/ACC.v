module ACC(clock,rst,load,shift,ad,msbin,lsbin,saida);
	input clock,rst,load,ad,shift;
	input [15:0] lsbin;
	input [16:0] msbin;
	output [31:0] saida;
	reg [32:0] mascara = 33'b0;
  
	assign saida = mascara[31:0];
    
	always@(posedge clock,posedge rst) begin
	   if(rst) begin
			   mascara <= 0;
				end
			else  begin
				case({load,ad,shift})
					3'b100 : mascara <= {17'b0,lsbin};
					3'b010 : mascara <= {msbin,mascara[15:0]};
					3'b001 : mascara <= {1'b0,mascara[32:1]};
					default: mascara <= mascara;
				endcase
			end
		end
		
endmodule 