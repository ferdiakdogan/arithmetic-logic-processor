module register1 #(parameter W=4) (clk, in, out, reset);

input [W-1:0] in;
input reset, clk;
output reg [W-1:0] out;

initial begin
	out = 0;
end

	always @(posedge clk) begin
	
		if (reset)
			out = 0;
		else 
			out = in;
	end
endmodule