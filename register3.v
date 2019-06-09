module register3 #(parameter W=4) (clk, parallel_in, serial_in, out, reset, parallel, right);

input [W-1:0] parallel_in;
input reset, clk, parallel, right, serial_in;
output reg [W-1:0] out;

	always @(posedge clk) begin
	
		if (reset)
			out = {W{1'b0}};
		else if(parallel)
			out = parallel_in;
		else if(right)
			out = {serial_in,out[W-1:1]};
		else
			out = {out[W-2:0],serial_in};
			
	end
endmodule