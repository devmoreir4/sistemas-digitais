module parity_checker(
	input [7:0] data_in,
   input parity_bit,
   output error             // Erro detectado (1 = erro, 0 = sem erro)
);

	assign erro = (parity_bit != ^data_in); // Verificando o bit de paridade
endmodule 