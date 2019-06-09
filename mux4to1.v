module mux4to1 #(parameter W=3)(out, in_0, in_1, in_2, in_3, select);


output reg [W-1:0] out;
input [W-1:0] in_0, in_1, in_2, in_3;
input [1:0] select;

always @(in_0, in_1, in_2, in_3, select)

	case(select)
	2'b00: out = in_0;
	2'b01: out = in_1;
	2'b10: out = in_2;
	2'b11: out = in_3;
	endcase

endmodule