module demux_1to8(
	input [7:0] data_in,
   input [2:0] address,
   output reg [7:0] sensor_out0,
   output reg [7:0] sensor_out1,
   output reg [7:0] sensor_out2,
   output reg [7:0] sensor_out3,
   output reg [7:0] sensor_out4,
   output reg [7:0] sensor_out5,
   output reg [7:0] sensor_out6,
   output reg [7:0] sensor_out7
);

	always @(*) begin
      sensor_out0 = 8'b0;
      sensor_out1 = 8'b0;
      sensor_out2 = 8'b0;
      sensor_out3 = 8'b0;
      sensor_out4 = 8'b0;
      sensor_out5 = 8'b0;
      sensor_out6 = 8'b0;
      sensor_out7 = 8'b0;
        
      case(address)
			3'b000: sensor_out0 = data_in;
         3'b001: sensor_out1 = data_in;
         3'b010: sensor_out2 = data_in;
         3'b011: sensor_out3 = data_in;
         3'b100: sensor_out4 = data_in;
         3'b101: sensor_out5 = data_in;
         3'b110: sensor_out6 = data_in;
         3'b111: sensor_out7 = data_in;
		endcase
	end

endmodule
