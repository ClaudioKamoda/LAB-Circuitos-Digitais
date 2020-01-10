module Div_Freq(clk, saida);

input clk;
output reg saida;
reg [25:0]meio;

always@(posedge clk)
begin
	if(meio == 26'd50000000)
		begin
			meio <= 26'd0;
			saida <= 1;
			//saida <= ~saida;
		end
	else
		begin
			meio <= meio + 1;
			saida <= 0;
		end
end

endmodule
