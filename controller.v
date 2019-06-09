module controller(clk, T, op, comp, E, clr, load, src0, src1, we0, we1, alusrcA, alusrcB,
alucntl, AccSrc, QSrc, AccCntl, Qcntl, enable, clr_SC, Q, reset_e);

input comp, clr, load, clk;
output reg reset_e, enable;
input E;
input [3:0] Q;
input [2:0] op;
input [3:0] T;
output reg we0, we1, AccSrc, QSrc, AccCntl, Qcntl, clr_SC;
output reg [1:0] src0, src1, alusrcA, alusrcB;
output reg [2:0] alucntl;



always @(posedge clk) begin
	if (comp) begin
		case (op)
			3'b000: begin
				if( T == 0 ) begin
					alucntl = 3'b000;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
			3'b001: begin
				if( T == 0 ) begin
					alucntl = 3'b001;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
			3'b010: begin
				if ( T == 0) begin
					AccSrc = 0;
					AccCntl = 1;
					Qcntl = 1;
					QSrc = 1;
					clr_SC = 0;
					reset_e = 1;
					enable = 0;
					we0 = 0;
					we1 = 0;
				end else if ( T == 1 || T == 3 || T == 5 || T == 7 ) begin
						AccSrc = 1;
						AccCntl = 1;
						Qcntl = 1;
						QSrc = 0;
						clr_SC = 0;
						enable = 0;
					
				end else if ( T == 2 || T == 4 || T == 6 || T == 8) begin
					if ( Q[0] == 1'b0 && E == 1'b1 ) begin
						reset_e = 0;
						alusrcA = 2'b10;
						alusrcB = 2'b01;
						alucntl = 3'b000;
					end else if ( Q[0] == 1'b1 && E == 1'b0 ) begin
						reset_e = 0;
						alusrcA = 2'b10;
						alusrcB = 2'b01;
						alucntl = 3'b001;
					end else begin
						reset_e = 0;
						alusrcA = 2'b10;
						alusrcB = 2'b00;
						alucntl = 3'b000;
					end
					AccCntl = 0;
					Qcntl = 0;
					clr_SC = 0;
					enable = 1;
				end else if ( T == 9 ) begin
					src0 = 2'b11;
					src1 = 2'b11;
					clr_SC = 1;
					we0 = 1;
					we1 = 1;
				end
			end
			3'b011: begin
			clr_SC = 0;
			end
			3'b100: begin
				if( T == 0 ) begin
					alucntl = 3'b100;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
			3'b101: begin
				if( T == 0 ) begin
					alucntl = 3'b101;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
					
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
			3'b110: begin
				if( T == 0 ) begin
					alucntl = 3'b110;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
			3'b111: begin
				if( T == 0 ) begin
					alucntl = 3'b011;
					alusrcA = 2'b01;
					alusrcB = 2'b01;
					clr_SC = 0;
				end else if ( T == 1) begin
					src0 = 2'b01;
					src1 = 2'b00;
					clr_SC = 0;
					we0 = 1;
					we1 = 1;
				end else if ( T == 2 ) begin
					we0 = 0;
					we1 = 0;
					clr_SC = 1;
				end
			end
	
		endcase
	
	end else begin
		if (load) begin
			src0 = 2'b10;
			src1 = 2'b10;
			we0 = 1;
			we1 = 1;
			clr_SC = 1;
		end else begin
			if ( clr ) begin
				src0 = 2'b00;
				src1 = 2'b00;
				we0 = 1;
				we1 = 1;
				clr_SC = 1;
			end else begin
				we1 = 0;
				we0 = 0;
				clr_SC = 1;
			end
		end
	end
end

endmodule
