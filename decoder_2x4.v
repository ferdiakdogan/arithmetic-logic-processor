module decoder_2x4(dec_out, dec_in, enable);
output [3:0]  dec_out;
input enable;
input [1:0] dec_in;

assign dec_out[0] = ~dec_in[1] & ~dec_in[0] & enable;
assign dec_out[1] = ~dec_in[1] & dec_in[0] & enable;
assign dec_out[2] = dec_in[1] & ~dec_in[0] & enable;
assign dec_out[3] = dec_in[1] & dec_in[0] & enable;

endmodule