module sequence #(parameter WIDTH = 4) (
	clk,
	out,
	clr,
);
	input clk;
	output reg [WIDTH-1:0] out;
	input clr;

	initial
	begin
		out = {WIDTH{1'b0}};
	end

	always @(posedge clk)
	begin
		if (clr)
			out <= {WIDTH{1'b0}};
		else
			out <= out + {{WIDTH-1{1'b0}}, 1'b1};
	end
endmodule