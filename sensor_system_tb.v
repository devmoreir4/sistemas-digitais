module sensor_system_tb;
	reg [7:0] sensor_data0, sensor_data1, sensor_data2, sensor_data3, sensor_data4, sensor_data5, sensor_data6, sensor_data7;
   reg clk;
   wire [10:0] packet_out;
   wire [7:0] sensor_out0, sensor_out1, sensor_out2, sensor_out3, sensor_out4, sensor_out5, sensor_out6, sensor_out7;
   wire error;

   // Instanciação do Top-Level
   sensor_system uut (
		.sensor_data0(sensor_data0),
      .sensor_data1(sensor_data1),
      .sensor_data2(sensor_data2),
      .sensor_data3(sensor_data3),
      .sensor_data4(sensor_data4),
      .sensor_data5(sensor_data5),
      .sensor_data6(sensor_data6),
      .sensor_data7(sensor_data7),
      .clk(clk),
      .packet_out(packet_out),
      .sensor_out0(sensor_out0),
      .sensor_out1(sensor_out1),
      .sensor_out2(sensor_out2),
      .sensor_out3(sensor_out3),
      .sensor_out4(sensor_out4),
      .sensor_out5(sensor_out5),
      .sensor_out6(sensor_out6),
      .sensor_out7(sensor_out7),
      .error(error)
   );

   // Clock Generator
   initial begin
		clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
      sensor_data0 = 8'b10101010;
      sensor_data1 = 8'b11001100;
      sensor_data2 = 8'b11110000;
      sensor_data3 = 8'b00001111;
      sensor_data4 = 8'b00110011;
      sensor_data5 = 8'b01010101;
      sensor_data6 = 8'b10011001;
      sensor_data7 = 8'b01100110;

      #100;
      $finish;
   end

   initial begin
		$monitor("Time: %0d | Packet: %b | Error: %b", $time, packet_out, error);
   end
endmodule
