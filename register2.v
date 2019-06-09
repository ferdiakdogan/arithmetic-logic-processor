module register2 #(parameter W=4) (clk, in, out, reset, enable);

input [W-1:0] in;
input reset, clk, enable;
output reg [W-1:0] out;

initial begin
	out = 0;
end

	always @(posedge clk) begin
	
		if (reset)
			out = 0;
		else if(enable)
			out = in;
		else
			out = out;
	end
endmodule