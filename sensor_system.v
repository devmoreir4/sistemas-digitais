module sensor_system(
	input [7:0] sensor_data0, sensor_data1, sensor_data2, sensor_data3, sensor_data4, sensor_data5, sensor_data6, sensor_data7,
   input clk,
   output [10:0] packet_out,
   output [7:0] sensor_out0,
   output [7:0] sensor_out1,
   output [7:0] sensor_out2,
   output [7:0] sensor_out3,
   output [7:0] sensor_out4,
   output [7:0] sensor_out5,
   output [7:0] sensor_out6,
   output [7:0] sensor_out7,
   output error
);

   // Sinais internos
	wire [2:0] address;
   wire [7:0] mux_out;
   wire parity_bit;

   // Contador para gerar o endereço sequencial de 3 bits
   reg [2:0] address_counter = 3'b000;
   always @(posedge clk) begin
		address_counter <= address_counter + 1;
   end
     
   assign address = address_counter;
     
   // Instanciando os módulos
   mux_8to1 mux (
		.sensor_data0(sensor_data0),
      .sensor_data1(sensor_data1),
      .sensor_data2(sensor_data2),
      .sensor_data3(sensor_data3),
      .sensor_data4(sensor_data4),
      .sensor_data5(sensor_data5),
      .sensor_data6(sensor_data6),
      .sensor_data7(sensor_data7),
      .address(address),
      .mux_out(mux_out)
   );

    
   parity_generator parity_gen (
		.data_in(mux_out),
		.parity_bit(parity_bit)
   );
     
   packet_transmitter pkt_tx (
		.data_in(mux_out),
      .address(address),
      .parity_bit(parity_bit),
      .packet_out(packet_out)
   );
     
   demux_1to8 demux (
		.data_in(packet_out[10:3]), // Dados do pacote transmitido
      .address(packet_out[2:0]),  // Endereço do pacote transmitido
      .sensor_out0(sensor_out0),
      .sensor_out1(sensor_out1),
      .sensor_out2(sensor_out2),
      .sensor_out3(sensor_out3),
      .sensor_out4(sensor_out4),
      .sensor_out5(sensor_out5),
      .sensor_out6(sensor_out6),
      .sensor_out7(sensor_out7)
   );
     
   parity_checker parity_chk (
		.data_in(packet_out[10:3]),    // Dados do pacote transmitido
      .parity_bit(packet_out[3]),    // Bit de paridade do pacote transmitido
      .error(error)
    );
     
endmodule
