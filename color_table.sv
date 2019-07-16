module color_table(input logic [7:0] color,
						 output logic [7:0]  R, G, B);

	logic [7:0] Red, Green, Blue;
						 
	always_comb
	begin
		unique case (color)
			8'd0:	begin //white 
				Red = 8'd163;
            Green = 8'd74;
            Blue = 8'd164;
			end
			8'd1: begin //black
				Red = 8'd00;
				Green = 8'd00;
				Blue = 8'd00;
			end
			8'd2: begin //white
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			end
			8'd3: begin //grey
				Red = 8'd127;
				Green = 8'd127;
				Blue = 8'd127;
			end
			8'd4: begin //frog body green
				Red = 8'hb5;
				Green = 8'he6;
				Blue = 8'h1d;
			end
			8'd5: begin //frog arm green
				Red = 8'd34;
				Green = 8'd177;
				Blue = 8'd76;
			end
			8'd6: begin //Frog Eye Red
				Red = 8'd237;
				Green = 8'd28;
				Blue = 8'd36;
			end
			8'd7: begin //red
				Red = 8'h88;
				Green = 8'h00;
				Blue = 8'h15;
			end
			
			8'd8: begin //light red
				Red = 8'hd9;
				Green = 8'h00;
				Blue = 8'h21;
			end
			8'd9: begin // beige (truck)
				Red = 8'd185;
				Green = 8'd122;
				Blue = 8'd87;
			end
			8'd10: begin // bush green (bg)
				Red = 8'd0;
				Green = 8'd152;
				Blue = 8'd0;
			end
			8'd11: begin // bush detail (bg)
				Red = 8'd7;
				Green = 8'd92;
				Blue = 8'd14;
			end
			8'd12: begin // flower outline (bg)
				Red = 8'd110;
				Green = 8'd131;
				Blue = 8'd19;
			end
			8'd13: begin // lily pad detail (bg)
				Red = 8'd171;
				Green = 8'd221;
				Blue = 8'd0;
			end
			8'd14: begin // lily pad central (bg)
				Red = 8'd153;
				Green = 8'd204;
				Blue = 8'd0;
			end
			8'd15: begin //water blue (bg)
				Red = 8'd51;
				Green = 8'd255;
				Blue = 8'd204;
			end
			8'd16: begin // wave blue (bg)
				Red = 8'd132;
				Green = 8'd255;
				Blue = 8'd224;
			end
			8'd17: begin // more wave blue (bg)
				Red = 8'd135;
				Green = 8'd255;
				Blue = 8'd255;
			end
			8'd18: begin // grass green (bg)
				Red = 8'd134;
				Green = 8'd255;
				Blue = 8'd0;
			end
			8'd19: begin // dark purple car
				Red = 8'd119;
				Green = 8'd53;
				Blue = 8'd119;
			end
			8'd20: begin // light purple
				Red = 8'd164;
				Green = 8'd147;
				Blue = 8'd239;
			end
			8'd21: begin // pink car
				Red = 8'd214;
				Green = 8'd106;
				Blue = 8'd244;
			end
			8'd22: begin // blue car
				Red = 8'd92;
				Green = 8'd175;
				Blue = 8'd251;
			end
			8'd23: begin // very light purple
				Red = 8'd222;
				Green = 8'd196;
				Blue = 8'd223;
			end
			8'd24: begin // yellow
				Red = 8'd255;
				Green = 8'd242;
				Blue = 8'd0;
			end
			8'd25: begin // more fucking purple
				Red = 8'd200;
				Green = 8'd191;
				Blue = 8'd231;
			end
			8'd26: begin // brown for log
				Red = 8'd175;
				Green = 8'd127;
				Blue = 8'd117;
			end
			8'd27: begin // another brown
				Red = 8'd210;
				Green = 8'd124;
				Blue = 8'd101;
			end
			8'd28: begin // more brown
				Red = 8'd185;
				Green = 8'd122;
				Blue = 8'd87;
			end
			8'd29: begin // light yellow
				Red = 8'd239;
				Green = 8'd228;
				Blue = 8'd176;
			end
			
		endcase
	end
	assign R = Red;
	assign G = Green;
	assign B = Blue;
endmodule