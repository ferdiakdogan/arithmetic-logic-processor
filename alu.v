module alu #(parameter W=4) ( A, B, out, CO, OVF, N, Z, cntl);

	input [W-1:0] A, B;
	input [2:0] cntl;
	output reg [W-1:0] out;
	output reg CO, OVF, N, Z;
	
	
initial begin
	CO = 0;
	OVF = 0;
	N = 0;
	Z = 0;
end
	
always @(A, B, cntl) begin

	case(cntl)
	3'b000:	begin //add
		{CO,out} = A + B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		if ((A[W-1]==0&&B[W-1]==0&&out[W-1]==1)||(A[W-1]==1&&B[W-1]==1&&out[W-1]==0))
			OVF = 1;
		else
			OVF = 0;
	end
	3'b001:	begin //subtract A - B
		{CO,out} = A - B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		if ((A[W-1]==0&&B[W-1]==1&&out[W-1]==1)||(A[W-1]==1&&B[W-1]==0&&out[W-1]==0))
			OVF = 1;
		else
			OVF = 0;
	end
	3'b010: begin //subtract B - A
		{CO,out} = B - A;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		if ((B[W-1]==0&&A[W-1]==1&&out[W-1]==1)||(B[W-1]==1&&A[W-1]==0&&out[W-1]==0))
			OVF = 1;
		else
			OVF = 0;
	end
	3'b011:	begin //Bit Clear
		out = A & ~B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		CO = 0;
		OVF = 0;
		
	end
	3'b100:	begin //And
		out = A & B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		CO = 0;
		OVF = 0;
			
	end
	3'b101:	begin	//Or
		out = A | B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		CO = 0;
		OVF = 0;
	end
	3'b110:	begin	//Xor
		out = A ^ B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		CO = 0;
		OVF = 0;
	end
	3'b111:	begin //Xnor
		out = A ~^ B;
		N = out[W-1];
		if (out == 0)
			Z = 1;
		else 
			Z = 0;
		CO = 0;
		OVF = 0;
	end
	default: begin //Default
		CO = 0;
		OVF = 0;
		N = 0;
		Z = 0;
	end
	endcase
	end
endmodule