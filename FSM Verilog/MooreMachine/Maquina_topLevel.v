module Maquina_topLevel(clkMaq, UP, DOWN, RESET, final);

input clkMaq, UP, DOWN, RESET;
output [6:0]final;
wire clkDiv;
wire [3:0]binario;

Div_Freq divisor(.clk(clkMaq), .saida(clkDiv));
Moore maquina_de_estados(.UP(UP), .DOWN(DOWN), .RESET(RESET), .clk(clkDiv), .saida(binario));
Decodificador decod(.BCD(binario), .segmentos(final));

endmodule
