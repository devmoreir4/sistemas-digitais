module parity_generator(
	input wire [7:0] data_in,
	output reg parity_bit
);
	always @(*) begin
		parity_bit = ^data_in; // XOR para calcular a paridade
	end
endmodule
