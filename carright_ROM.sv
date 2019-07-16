module carrightrom
(
	input logic [5:0] DX, DY,
	input logic  dir,
	output logic [7:0] data
);
// 1
	int carright [24][24];
	
	always_ff
	begin
	
	carright = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,6,6,6,6,6,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,6,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,2,2,2,2,2,2,2,2,3,3,3,2,2,0,0,0,0,0,0,0,0},
'{0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0},
'{0,3,3,3,3,3,3,3,3,2,2,2,5,5,5,5,2,2,0,0,0,0,0,0},
'{0,0,0,6,2,6,2,6,2,6,2,2,2,3,5,5,5,2,2,0,0,0,0,0},
'{0,0,0,6,2,6,2,6,2,6,6,2,3,3,5,5,5,5,2,2,0,0,0,0},
'{0,0,0,6,2,6,2,6,2,6,2,2,2,3,5,5,5,2,2,0,0,0,0,0},
'{0,3,3,3,3,3,3,3,3,2,2,2,5,5,5,5,2,2,0,0,0,0,0,0},
'{0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0},
'{0,0,0,2,2,2,2,2,2,2,2,3,3,3,2,2,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,6,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,6,6,6,6,6,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};

	end
	
	always_ff
	begin
		data = carright[DY][DX];
	//unique case (dir)
		//1'd0: data = truckleft[DY][DX];
		//1'd1: data = truckright[DY][DX];
		
	//endcase

	end
endmodule