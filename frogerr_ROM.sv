module froggerrom
(
	input logic [4:0] DX, DY,
	input logic [2:0] dir,
	output logic [7:0] data
);
// 1
	int frogstandup [24][24];
	int frogjumpup [24][24];
	int frogstanddown [24][24];
	int frogjumpdown [24][24];
	int frogstandleft [24][24];
	int frogjumpleft [24][24];
	int frogstandright [24][24];
	int frogjumpright [24][24];
	
	always_ff
	begin
	 frogstandup = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,0,0,4,4,4,4,0,0,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,6,6,4,4,6,6,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,6,6,4,4,6,6,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,4,4,4,4,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};

	frogjumpup = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,4,4,4,4,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,6,6,4,4,6,6,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,6,6,4,4,6,6,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,0,0,0,0,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,0,0,0,0,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogstanddown = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,4,4,4,4,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,6,6,4,4,6,6,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,6,6,4,4,6,6,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,0,0,4,4,4,4,0,0,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogjumpdown = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,0,0,0,0,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,0,0,0,0,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,4,4,4,4,4,4,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,6,6,4,4,6,6,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,6,6,4,4,6,6,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,4,4,4,4,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogstandleft = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,5,5,0,0,0,0,0,5,5,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,0,5,5,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,6,6,4,4,4,4,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,4,6,6,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,4,6,6,4,4,4,4,4,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,6,6,4,4,4,4,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,5,0,0,0,5,5,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,5,5,5,0,0,0,0,0,5,5,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogjumpleft = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,5,5,5,0,0,0,5,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,6,6,4,4,4,4,4,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,4,6,6,4,4,4,4,4,0,0,0,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,4,6,6,4,4,4,4,4,0,0,0,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,0,6,6,4,4,4,4,4,0,5,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,5,5,5,0,0,0,5,5,5,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogstandright = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,5,5,0,0,0,0,0,5,5,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,5,5,0,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,4,4,4,4,6,6,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,6,6,4,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,4,4,4,4,4,6,6,4,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,4,4,4,4,6,6,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,5,5,0,0,0,5,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,5,5,0,0,0,0,0,5,5,5,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};


frogjumpright = '{'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,5,0,0,0,5,5,5,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,4,4,4,4,4,6,6,0,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,0,0,0,4,4,4,4,4,6,6,4,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,0},
'{0,0,0,0,0,5,5,0,0,0,4,4,4,4,4,6,6,4,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,5,5,0,4,4,4,4,4,6,6,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,5,5,5,0,0,0,5,5,5,5,5,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
'{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};



	end
	
	always_ff
	begin
	
	unique case (dir)
		3'd0: data = frogstandup[DY][DX];
		3'd1: data = frogstandright[DY][DX];
		3'd2: data = frogstanddown[DY][DX];
		3'd3: data = frogstandleft[DY][DX];
		3'd4: data = frogjumpup[DY][DX];
		3'd5: data = frogjumpright[DY][DX];
		3'd6: data = frogjumpdown[DY][DX];
		3'd7: data = frogjumpleft[DY][DX];
	endcase

	end
endmodule
