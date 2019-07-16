module d_flipflop
(
	input  logic Clk, Reset, Data,
	output logic Q, Q_not
);

always_ff @ ( posedge Clk)
	
	if (~Reset)
	begin
		Q <= 1'b0;
		Q_not <= 1'b1;
	end
	
	else
		begin
			Q <= Data;
			Q_not <= ~Data;
		end

endmodule
