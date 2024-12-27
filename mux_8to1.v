module mux_8to1(
	input [7:0] sensor_data0,
   input [7:0] sensor_data1,
   input [7:0] sensor_data2,
   input [7:0] sensor_data3,
   input [7:0] sensor_data4,
   input [7:0] sensor_data5,
   input [7:0] sensor_data6,
   input [7:0] sensor_data7,
   input [2:0] address,
   output reg [7:0] mux_out
);

	always @(*) begin
		case (address)
			3'b000: mux_out = sensor_data0;
         3'b001: mux_out = sensor_data1;
         3'b010: mux_out = sensor_data2;
         3'b011: mux_out = sensor_data3;
         3'b100: mux_out = sensor_data4;
         3'b101: mux_out = sensor_data5;
         3'b110: mux_out = sensor_data6;
         3'b111: mux_out = sensor_data7;
         default: mux_out = 8'b00000000;
      endcase
	end
endmodule
