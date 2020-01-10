module Decodificador(BCD, segmentos);

input [3:0] BCD;
output reg [6:0] segmentos;

always@(BCD)
begin
	case(BCD)
		0: segmentos = 7'b000_0001;
		1: segmentos = 7'b100_1111;
		2: segmentos = 7'b001_0010;
		3: segmentos = 7'b000_0110;
		4: segmentos = 7'b100_1100;
		5: segmentos = 7'b010_0100;
		6: segmentos = 7'b010_0000;
		7: segmentos = 7'b000_1111;
		8: segmentos = 7'b000_0000;
		9: segmentos = 7'b000_0100;
		default: segmentos = 7'b111_1111;
	endcase
end

endmodule