module Moore(UP, DOWN, RESET, clk, saida);

input UP, DOWN, RESET, clk;
output reg [3:0]saida;

reg [3:0]proxEstado, estadoAtual;
parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, 
D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, 
H = 4'b0111, I = 4'b1000, J = 4'b1001;

always@(UP or DOWN or estadoAtual)
begin
	case(estadoAtual)
		A: 
			if(UP == 0 && DOWN == 0)
				proxEstado = A;
			else if(UP == 0 && DOWN == 1)
				proxEstado = I;
			else if(UP == 1 && DOWN == 0)
				proxEstado = B;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		B:	
			if(UP == 0 && DOWN == 0)
				proxEstado = B;
			else if(UP == 0 && DOWN == 1)
				proxEstado = A;
			else if(UP == 1 && DOWN == 0)
				proxEstado = C;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		C: 
			if(UP == 0 && DOWN == 0)
				proxEstado = C;
			else if(UP == 0 && DOWN == 1)
				proxEstado = B;
			else if(UP == 1 && DOWN == 0)
				proxEstado = D;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		D: 
			if(UP == 0 && DOWN == 0)
				proxEstado = D;
			else if(UP == 0 && DOWN == 1)
				proxEstado = C;
			else if(UP == 1 && DOWN == 0)
				proxEstado = E;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		E: 
			if(UP == 0 && DOWN == 0)
				proxEstado = E;
			else if(UP == 0 && DOWN == 1)
				proxEstado = D;
			else if(UP == 1 && DOWN == 0)
				proxEstado = F;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		F: 
			if(UP == 0 && DOWN == 0)
				proxEstado = F;
			else if(UP == 0 && DOWN == 1)
				proxEstado = E;
			else if(UP == 1 && DOWN == 0)
				proxEstado = G;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		G: 
			if(UP == 0 && DOWN == 0)
				proxEstado = G;
			else if(UP == 0 && DOWN == 1)
				proxEstado = F;
			else if(UP == 1 && DOWN == 0)
				proxEstado = H;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		H: 
			if(UP == 0 && DOWN == 0)
				proxEstado = H;
			else if(UP == 0 && DOWN == 1)
				proxEstado = G;
			else if(UP == 1 && DOWN == 0)
				proxEstado = I;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		I: 
			if(UP == 0 && DOWN == 0)
				proxEstado = I;
			else if(UP == 0 && DOWN == 1)
				proxEstado = H;
			else if(UP == 1 && DOWN == 0)
				proxEstado = A;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		J: 
			if(UP == 0 && DOWN == 0)
				proxEstado = J;
			else if(UP == 0 && DOWN == 1)
				proxEstado = A;
			else if(UP == 1 && DOWN == 0)
				proxEstado = A;
			else if(UP == 1 && DOWN == 1)
				proxEstado = J;
		default:
			proxEstado = A;
	endcase
end

always@(posedge clk or posedge RESET)
begin
	if(RESET == 1)
		estadoAtual <= A;
	else
		estadoAtual <= proxEstado;
end

always@(estadoAtual)
begin
	case(estadoAtual)
		A: saida <= 4'b0001;
		B:	saida <= 4'b0100;
		C: saida <= 4'b0111;
		D: saida <= 4'b1000;
		E: saida <= 4'b1001;
		F: saida <= 4'b0000;
		G: saida <= 4'b0001;
		H: saida <= 4'b0010;
		I: saida <= 4'b0101;
		J: saida <= 4'b1111;
		default: saida <= 4'b0001;
	endcase
end

endmodule
