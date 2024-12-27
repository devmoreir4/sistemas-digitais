module packet_transmitter(
	input wire [7:0] data_in,
	input wire [2:0] address,
	input wire parity_bit,
	output wire [10:0] packet_out
);

	// Concatenação explícita das partes do pacote
	assign packet_out = {data_in, parity_bit, address};

endmodule
