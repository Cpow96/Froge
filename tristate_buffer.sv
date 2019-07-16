module tristate_buffer(
		input logic [15:0] input_x, 
		input enable, 
		output logic [15:0] output_x
);


	always_comb
		begin
			unique case (enable)
				1'b0		: output_x = 16'bzzzzzzzzzzzzzzzz;
				default	: output_x = input_x;
			endcase
		end

endmodule
