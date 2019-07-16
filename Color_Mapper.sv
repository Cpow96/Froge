//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, 
								input logic pad1, pad2, pad3, pad4, pad5, unpaused,
								input int win,
								slog1x, slog1y,

									slog2x, slog2y,
									slog3x, slog3y,
									slog4x, slog4y,
									slog5x, slog5y,
									slog6x, slog6y,
									slog7x, slog7y,
									slog8x, slog8y,
									slog9x, slog16y,
									slog10x, slog9y,
									slog11x, slog10y,
									slog12x, slog11y,
									slog13x, slog12y,
									slog14x, slog13y,
									slog15x, slog14y,
									slog16x, slog15y,
									slog17x, slog17y,
									slog18x, slog18y,
									slog19x, slog19y,
									slog20x, slog20y,
									slog21x, slog21y,
									slog22x, slog22y,
									slog23x, slog23y,
									slog24x, slog24y,
									
									blog1x, blog1y,
									blog2x, blog2y,
									blog3x, blog3y,
									blog4x, blog4y,
									blog5x, blog5y,
									blog6x, blog6y,
									blog7x, blog7y,
									blog8x, blog8y,
									blog9x, blog9y,
					
								 truck1x, truck1y, 
								 truck2x, truck2y,
								 truck3x, truck3y,
								 truck4x, truck4y,
								 truck5x, truck5y,
								 truck6x, truck6y,
								 truck7x, truck7y, 
								 truck8x, truck8y,
								 
								 conn1x, conn1y,
								 conn2x, conn2y,
								 conn3x, conn3y,
								 conn4x, conn4y,
								 conn5x, conn5y,
					
								carright1x, carright1y,
								carright2x, carright2y,
								carright3x, carright3y,
								carright4x, carright4y,
								carright5x, carright5y,
								carright6x, carright6y,
								carright7x, carright7y,
								carright8x, carright8y,
								
								othercarright1x, othercarright1y,
								othercarright2x, othercarright2y,
								othercarright3x, othercarright3y,
								othercarright4x, othercarright4y,
								carleft1x, carleft1y,
								carleft2x, carleft2y,
								carleft3x, carleft3y,
								carleft4x, carleft4y,
								carleft5x, carleft5y,
								carleft6x, carleft6y,
								input [2:0] direction,
								input
 
								slog1dir,
								slog2dir,
								slog3dir,
								slog4dir,
								slog5dir,
								slog6dir,
								slog7dir,
								slog9dir,
								slog10dir,
								slog11dir,
								slog12dir,
								slog13dir,
								slog14dir,
								slog15dir,
								slog16dir,
								slog17dir,
								slog18dir,
								slog19dir,
								slog20dir,
								slog21dir,
								slog22dir,
								slog23dir,
								slog24dir,
								slog8dir,
								
								blog1dir,
								blog2dir,
								blog3dir,
								blog4dir,
								blog5dir,
								blog6dir,
								blog7dir,
								blog8dir,
								blog9dir,
								
								
								truck1dir, 
								truck2dir,
								truck3dir,
								truck4dir,
								truck5dir,
								truck6dir,
								truck7dir,
								truck8dir,
								
								carleft1dir, 
								carleft2dir, 
								carleft3dir, 
								carleft4dir, 
								carleft5dir, 
								carleft6dir, 
								
								carright1dir, 
								carright2dir, 
								carright3dir, 
								carright4dir, 
								carright5dir, 
								carright6dir, 
								carright7dir, 
								carright8dir, 
								othercarright1dir,
								othercarright2dir,
								othercarright3dir,
								othercarright4dir,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on, 
	 slog1on, slog2on, slog3on, slog4on, slog5on, slog6on, slog7on, slog8on,
	 slog9on, slog10on, slog11on, slog12on, slog13on, slog14on, slog15on, slog16on,
	 slog17on, slog18on, slog19on, slog20on, slog21on, slog22on, slog23on, slog24on,
	 blog1on, blog2on, blog3on, blog4on, blog5on, blog6on, blog7on, blog8on, blog9on,
	 truck1on, truck2on, truck3on, truck4on, truck5on, truck6on, truck7on, truck8on, 
	 carleft1on, carleft2on, carleft3on, carleft4on, carleft5on, carleft6on, 
	 carright1on, carright2on, carright3on, carright4on, carright5on, carright6on, carright7on, carright8on, 
	 othercarright1on, othercarright2on, othercarright3on, othercarright4on,
	 pad1on, pad2on, pad3on, pad4on, pad5on, pausedon;          // signals for if sprites are on
	 //logic [4:0] pacROM_Addr;
	 //logic [31:0] pacROM_Data;
	 //logic [4:0] pacROM_Idx;
	 
	 //assign pacROM_Addr = DrawY - (BallY);
	 //assign pacROM_Idx = DrawX - (BallX);
	 //pacmanJr_ROM pacROM(.addr(pacROM_Addr), .data(pacROM_Data));
	 
	 logic [7:0] mapcolorout;
	 logic [7:0] mapR, mapG, mapB;
	 
	 maprom Mapdatarom(.DX(DrawX), .DY(DrawY), .data(mapcolorout));
	 color_table 			MAPCOLORS (.color(mapcolorout),
											.R(mapR), 
											.G(mapG), 
											.B(mapB));
											
	 logic [7:0] screencolorout;
	 logic [7:0] screenR, screenG, screenB;
	 
	 screenrom screendatarom(.DX(DrawX), .DY(DrawY), .data(screencolorout));
	 color_table 			screenCOLORS (.color(screencolorout),
											.R(screenR), 
											.G(screenG), 
											.B(screenB));
	 
	 //STUFF FOR conn 1
	 int conn1dx, conn1dy;
	 assign conn1dx = DrawX - 76;           // distances for conn 1
    assign conn1dy = DrawY - 20;

	logic[7:0] conn1colorout;
	logic[7:0] conn1R, conn1G, conn1B;
	connrom conn1(.DX(conn1dx), .DY(conn1dy), .data(conn1colorout));
	  color_table			conn1color(.color(conn1colorout),
												.R(conn1R),
												.G(conn1G),
												.B(conn1B));
												
	 //STUFF FOR conn 1
	 int conn2dx, conn2dy;
	 assign conn2dx = DrawX - 191;           // distances for conn 1
    assign conn2dy = DrawY - 20;

	logic[7:0] conn2colorout;
	logic[7:0] conn2R, conn2G, conn2B;
	connrom conn2(.DX(conn2dx), .DY(conn2dy),  .data(conn2colorout));
	  color_table			conn2color(.color(conn2colorout),
												.R(conn2R),
												.G(conn2G),
												.B(conn2B));
												
	 //STUFF FOR conn 1
	 int conn3dx, conn3dy;
	 assign conn3dx = DrawX - 309;           // distances for conn 1
    assign conn3dy = DrawY - 20;

	logic[7:0] conn3colorout;
	logic[7:0] conn3R, conn3G, conn3B;
	connrom conn3(.DX(conn3dx), .DY(conn3dy), .data(conn3colorout));
	  color_table			conn3color(.color(conn3colorout),
												.R(conn3R),
												.G(conn3G),
												.B(conn3B));
												
												
	 //STUFF FOR conn 1
	 int conn4dx, conn4dy;
	 assign conn4dx = DrawX - 425;           // distances for conn 1
    assign conn4dy = DrawY - 20;

	logic[7:0] conn4colorout;
	logic[7:0] conn4R, conn4G, conn4B;
	connrom conn4(.DX(conn4dx), .DY(conn4dy), .data(conn4colorout));
	  color_table			conn4color(.color(conn4colorout),
												.R(conn4R),
												.G(conn4G),
												.B(conn4B));
												
	 //STUFF FOR conn 1
	 int conn5dx, conn5dy;
	 assign conn5dx = DrawX - 541;           // distances for conn 1
    assign conn5dy = DrawY - 20;

	logic[7:0] conn5colorout;
	logic[7:0] conn5R, conn5G, conn5B;
	connrom conn5(.DX(conn5dx), .DY(conn5dy), .data(conn5colorout));
	  color_table			conn5color(.color(conn5colorout),
												.R(conn5R),
												.G(conn5G),
												.B(conn5B));
												

	 
	 
	int DistX, DistY;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
	logic[7:0] frogcolorout;
	logic[7:0] Rfrog, Gfrog, Bfrog;
	froggerrom Froggercolor(.DX(DistX), .DY(DistY), .dir(direction), .data(frogcolorout) );
	color_table 			froggercolor (.color(frogcolorout),
											.R(Rfrog), 
											.G(Gfrog), 
											.B(Bfrog));
											
	//STUFF FOR blog 1
	 int blog1dx, blog1dy;
	 assign blog1dx = DrawX - blog1x;           // distances for blog 1
    assign blog1dy = DrawY - blog1y;

	logic[7:0] blog1colorout;
	logic[7:0] blog1R, blog1G, blog1B;
	blogrom blog1(.DX(blog1dx), .DY(blog1dy), .dir(blog1dir), .data(blog1colorout));
	  color_table			blog1color(.color(blog1colorout),
												.R(blog1R),
												.G(blog1G),
												.B(blog1B));
												
	//STUFF FOR blog 2
	 int blog2dx, blog2dy;
	 assign blog2dx = DrawX - blog2x;           // distances for blog 2
    assign blog2dy = DrawY - blog2y;

	logic[7:0] blog2colorout;
	logic[7:0] blog2R, blog2G, blog2B;
	blogrom blog2(.DX(blog2dx), .DY(blog2dy), .dir(blog2dir), .data(blog2colorout));
	  color_table			blog2color(.color(blog2colorout),
												.R(blog2R),
												.G(blog2G),
												.B(blog2B));
												
	//STUFF FOR blog 3
	 int blog3dx, blog3dy;
	 assign blog3dx = DrawX - blog3x;           // distances for blog 3
    assign blog3dy = DrawY - blog3y;

	logic[7:0] blog3colorout;
	logic[7:0] blog3R, blog3G, blog3B;
	blogrom blog3(.DX(blog3dx), .DY(blog3dy), .dir(blog3dir), .data(blog3colorout));
	  color_table			blog3color(.color(blog3colorout),
												.R(blog3R),
												.G(blog3G),
												.B(blog3B));
												
	//STUFF FOR blog 4
	 int blog4dx, blog4dy;
	 assign blog4dx = DrawX - blog4x;           // distances for blog 4
    assign blog4dy = DrawY - blog4y;

	logic[7:0] blog4colorout;
	logic[7:0] blog4R, blog4G, blog4B;
	blogrom blog4(.DX(blog4dx), .DY(blog4dy), .dir(blog4dir), .data(blog4colorout));
	  color_table			blog4color(.color(blog4colorout),
												.R(blog4R),
												.G(blog4G),
												.B(blog4B));
												
	//STUFF FOR blog 5
	 int blog5dx, blog5dy;
	 assign blog5dx = DrawX - blog5x;           // distances for blog 5
    assign blog5dy = DrawY - blog5y;

	logic[7:0] blog5colorout;
	logic[7:0] blog5R, blog5G, blog5B;
	blogrom blog5(.DX(blog5dx), .DY(blog5dy), .dir(blog5dir), .data(blog5colorout));
	  color_table			blog5color(.color(blog5colorout),
												.R(blog5R),
												.G(blog5G),
												.B(blog5B));

	//STUFF FOR blog 6
	 int blog6dx, blog6dy;
	 assign blog6dx = DrawX - blog6x;           // distances for blog 6
    assign blog6dy = DrawY - blog6y;

	logic[7:0] blog6colorout;
	logic[7:0] blog6R, blog6G, blog6B;
	blogrom blog6(.DX(blog6dx), .DY(blog6dy), .dir(blog6dir), .data(blog6colorout));
	  color_table			blog6color(.color(blog6colorout),
												.R(blog6R),
												.G(blog6G),
												.B(blog6B));

	//STUFF FOR blog 7
	 int blog7dx, blog7dy;
	 assign blog7dx = DrawX - blog7x;           // distances for blog 7
    assign blog7dy = DrawY - blog7y;

	logic[7:0] blog7colorout;
	logic[7:0] blog7R, blog7G, blog7B;
	blogrom blog7(.DX(blog7dx), .DY(blog7dy), .dir(blog7dir), .data(blog7colorout));
	  color_table			blog7color(.color(blog7colorout),
												.R(blog7R),
												.G(blog7G),
												.B(blog7B));

	//STUFF FOR blog 8
	 int blog8dx, blog8dy;
	 assign blog8dx = DrawX - blog8x;           // distances for blog 8
    assign blog8dy = DrawY - blog8y;

	logic[7:0] blog8colorout;
	logic[7:0] blog8R, blog8G, blog8B;
	blogrom blog8(.DX(blog8dx), .DY(blog8dy), .dir(blog8dir), .data(blog8colorout));
	  color_table			blog8color(.color(blog8colorout),
												.R(blog8R),
												.G(blog8G),
												.B(blog8B));

	//STUFF FOR blog 9
	 int blog9dx, blog9dy;
	 assign blog9dx = DrawX - blog9x;           // distances for blog 9
    assign blog9dy = DrawY - blog9y;

	logic[7:0] blog9colorout;
	logic[7:0] blog9R, blog9G, blog9B;
	blogrom blog9(.DX(blog9dx), .DY(blog9dy), .dir(blog9dir), .data(blog9colorout));
	  color_table			blog9color(.color(blog9colorout),
												.R(blog9R),
												.G(blog9G),
												.B(blog9B));												

	
	//STUFF FOR slog 1
	 int slog1dx, slog1dy;
	 assign slog1dx = DrawX - slog1x;           // distances for slog 1
    assign slog1dy = DrawY - slog1y;

	logic[7:0] slog1colorout;
	logic[7:0] slog1R, slog1G, slog1B;
	slogrom slog1(.DX(slog1dx), .DY(slog1dy), .dir(slog1dir), .data(slog1colorout));
	  color_table			slog1color(.color(slog1colorout),
												.R(slog1R),
												.G(slog1G),
												.B(slog1B));
												
		//STUFF FOR slog 2
	 int slog2dx, slog2dy;
	 assign slog2dx = DrawX - slog2x;           // distances for slog 2
    assign slog2dy = DrawY - slog2y;

	logic[7:0] slog2colorout;
	logic[7:0] slog2R, slog2G, slog2B;
	slogrom slog2(.DX(slog2dx), .DY(slog2dy), .dir(slog2dir), .data(slog2colorout));
	  color_table			slog2color(.color(slog2colorout),
												.R(slog2R),
												.G(slog2G),
												.B(slog2B));
												
		//STUFF FOR slog 3
	 int slog3dx, slog3dy;
	 assign slog3dx = DrawX - slog3x;           // distances for slog 3
    assign slog3dy = DrawY - slog3y;

	logic[7:0] slog3colorout;
	logic[7:0] slog3R, slog3G, slog3B;
	slogrom slog3(.DX(slog3dx), .DY(slog3dy), .dir(slog3dir), .data(slog3colorout));
	  color_table			slog3color(.color(slog3colorout),
												.R(slog3R),
												.G(slog3G),
												.B(slog3B));
												
		//STUFF FOR slog 4
	 int slog4dx, slog4dy;
	 assign slog4dx = DrawX - slog4x;           // distances for slog 4
    assign slog4dy = DrawY - slog4y;

	logic[7:0] slog4colorout;
	logic[7:0] slog4R, slog4G, slog4B;
	slogrom slog4(.DX(slog4dx), .DY(slog4dy), .dir(slog4dir), .data(slog4colorout));
	  color_table			slog4color(.color(slog4colorout),
												.R(slog4R),
												.G(slog4G),
												.B(slog4B));
												
		//STUFF FOR slog 5
	 int slog5dx, slog5dy;
	 assign slog5dx = DrawX - slog5x;           // distances for slog 5
    assign slog5dy = DrawY - slog5y;

	logic[7:0] slog5colorout;
	logic[7:0] slog5R, slog5G, slog5B;
	slogrom slog5(.DX(slog5dx), .DY(slog5dy), .dir(slog5dir), .data(slog5colorout));
	  color_table			slog5color(.color(slog5colorout),
												.R(slog5R),
												.G(slog5G),
												.B(slog5B));
												
		//STUFF FOR slog 6
	 int slog6dx, slog6dy;
	 assign slog6dx = DrawX - slog6x;           // distances for slog 6
    assign slog6dy = DrawY - slog6y;

	logic[7:0] slog6colorout;
	logic[7:0] slog6R, slog6G, slog6B;
	slogrom slog6(.DX(slog6dx), .DY(slog6dy), .dir(slog6dir), .data(slog6colorout));
	  color_table			slog6color(.color(slog6colorout),
												.R(slog6R),
												.G(slog6G),
												.B(slog6B));
												
		//STUFF FOR slog 7
	 int slog7dx, slog7dy;
	 assign slog7dx = DrawX - slog7x;           // distances for slog 7
    assign slog7dy = DrawY - slog7y;

	logic[7:0] slog7colorout;
	logic[7:0] slog7R, slog7G, slog7B;
	slogrom slog7(.DX(slog7dx), .DY(slog7dy), .dir(slog7dir), .data(slog7colorout));
	  color_table			slog7color(.color(slog7colorout),
												.R(slog7R),
												.G(slog7G),
												.B(slog7B));
												
		//STUFF FOR slog 8
	 int slog8dx, slog8dy;
	 assign slog8dx = DrawX - slog8x;           // distances for slog 8
    assign slog8dy = DrawY - slog8y;

	logic[7:0] slog8colorout;
	logic[7:0] slog8R, slog8G, slog8B;
	slogrom slog8(.DX(slog8dx), .DY(slog8dy), .dir(slog8dir), .data(slog8colorout));
	  color_table			slog8color(.color(slog8colorout),
												.R(slog8R),
												.G(slog8G),
												.B(slog8B));
												
												
		//STUFF FOR slog 9
	 int slog9dx, slog9dy;
	 assign slog9dx = DrawX - slog9x;           // distances for slog 9
    assign slog9dy = DrawY - slog9y;

	logic[7:0] slog9colorout;
	logic[7:0] slog9R, slog9G, slog9B;
	slogrom slog9(.DX(slog9dx), .DY(slog9dy), .dir(slog9dir), .data(slog9colorout));
	  color_table			slog9color(.color(slog9colorout),
												.R(slog9R),
												.G(slog9G),
												.B(slog9B));
												
		//STUFF FOR slog 10
	 int slog10dx, slog10dy;
	 assign slog10dx = DrawX - slog10x;           // distances for slog 10
    assign slog10dy = DrawY - slog10y;

	logic[7:0] slog10colorout;
	logic[7:0] slog10R, slog10G, slog10B;
	slogrom slog10(.DX(slog10dx), .DY(slog10dy), .dir(slog10dir), .data(slog10colorout));
	  color_table			slog10color(.color(slog10colorout),
												.R(slog10R),
												.G(slog10G),
												.B(slog10B));
												
		//STUFF FOR slog 11
	 int slog11dx, slog11dy;
	 assign slog11dx = DrawX - slog11x;           // distances for slog 11
    assign slog11dy = DrawY - slog11y;

	logic[7:0] slog11colorout;
	logic[7:0] slog11R, slog11G, slog11B;
	slogrom slog11(.DX(slog11dx), .DY(slog11dy), .dir(slog11dir), .data(slog11colorout));
	  color_table			slog11color(.color(slog11colorout),
												.R(slog11R),
												.G(slog11G),
												.B(slog11B));
												
		//STUFF FOR slog 12
	 int slog12dx, slog12dy;
	 assign slog12dx = DrawX - slog12x;           // distances for slog 12
    assign slog12dy = DrawY - slog12y;

	logic[7:0] slog12colorout;
	logic[7:0] slog12R, slog12G, slog12B;
	slogrom slog12(.DX(slog12dx), .DY(slog12dy), .dir(slog12dir), .data(slog12colorout));
	  color_table			slog12color(.color(slog12colorout),
												.R(slog12R),
												.G(slog12G),
												.B(slog12B));
												
		//STUFF FOR slog 13
	 int slog13dx, slog13dy;
	 assign slog13dx = DrawX - slog13x;           // distances for slog 13
    assign slog13dy = DrawY - slog13y;

	logic[7:0] slog13colorout;
	logic[7:0] slog13R, slog13G, slog13B;
	slogrom slog13(.DX(slog13dx), .DY(slog13dy), .dir(slog13dir), .data(slog13colorout));
	  color_table			slog13color(.color(slog13colorout),
												.R(slog13R),
												.G(slog13G),
												.B(slog13B));
												
		//STUFF FOR slog 14
	 int slog14dx, slog14dy;
	 assign slog14dx = DrawX - slog14x;           // distances for slog 14
    assign slog14dy = DrawY - slog14y;

	logic[7:0] slog14colorout;
	logic[7:0] slog14R, slog14G, slog14B;
	slogrom slog14(.DX(slog14dx), .DY(slog14dy), .dir(slog14dir), .data(slog14colorout));
	  color_table			slog14color(.color(slog14colorout),
												.R(slog14R),
												.G(slog14G),
												.B(slog14B));
												
		//STUFF FOR slog 15
	 int slog15dx, slog15dy;
	 assign slog15dx = DrawX - slog15x;           // distances for slog 15
    assign slog15dy = DrawY - slog15y;

	logic[7:0] slog15colorout;
	logic[7:0] slog15R, slog15G, slog15B;
	slogrom slog15(.DX(slog15dx), .DY(slog15dy), .dir(slog15dir), .data(slog15colorout));
	  color_table			slog15color(.color(slog15colorout),
												.R(slog15R),
												.G(slog15G),
												.B(slog15B));
												
		//STUFF FOR slog 16 -----------
	 int slog16dx, slog16dy;
	 assign slog16dx = DrawX - slog16x;           // distances for slog 16
    assign slog16dy = DrawY - slog16y;

	logic[7:0] slog16colorout;
	logic[7:0] slog16R, slog16G, slog16B;
	slogrom slog16(.DX(slog16dx), .DY(slog16dy), .dir(slog16dir), .data(slog16colorout));
	  color_table			slog16color(.color(slog16colorout),
												.R(slog16R),
												.G(slog16G),
												.B(slog16B));
												
												
			//STUFF FOR slog 17
	 int slog17dx, slog17dy;
	 assign slog17dx = DrawX - slog17x;           // distances for slog 17
    assign slog17dy = DrawY - slog17y;

	logic[7:0] slog17colorout;
	logic[7:0] slog17R, slog17G, slog17B;
	slogrom slog17(.DX(slog17dx), .DY(slog17dy), .dir(slog17dir), .data(slog17colorout));
	  color_table			slog17color(.color(slog17colorout),
												.R(slog17R),
												.G(slog17G),
												.B(slog17B));
												
		//STUFF FOR slog 18
	 int slog18dx, slog18dy;
	 assign slog18dx = DrawX - slog18x;           // distances for slog 18
    assign slog18dy = DrawY - slog18y;

	logic[7:0] slog18colorout;
	logic[7:0] slog18R, slog18G, slog18B;
	slogrom slog18(.DX(slog18dx), .DY(slog18dy), .dir(slog18dir), .data(slog18colorout));
	  color_table			slog18color(.color(slog18colorout),
												.R(slog18R),
												.G(slog18G),
												.B(slog18B));
												
		//STUFF FOR slog 19
	 int slog19dx, slog19dy;
	 assign slog19dx = DrawX - slog19x;           // distances for slog 19
    assign slog19dy = DrawY - slog19y;

	logic[7:0] slog19colorout;
	logic[7:0] slog19R, slog19G, slog19B;
	slogrom slog19(.DX(slog19dx), .DY(slog19dy), .dir(slog19dir), .data(slog19colorout));
	  color_table			slog19color(.color(slog19colorout),
												.R(slog19R),
												.G(slog19G),
												.B(slog19B));
												
		//STUFF FOR slog 20
	 int slog20dx, slog20dy;
	 assign slog20dx = DrawX - slog20x;           // distances for slog 20
    assign slog20dy = DrawY - slog20y;

	logic[7:0] slog20colorout;
	logic[7:0] slog20R, slog20G, slog20B;
	slogrom slog20(.DX(slog20dx), .DY(slog20dy), .dir(slog20dir), .data(slog20colorout));
	  color_table			slog20color(.color(slog20colorout),
												.R(slog20R),
												.G(slog20G),
												.B(slog20B));
												
		//STUFF FOR slog 21
	 int slog21dx, slog21dy;
	 assign slog21dx = DrawX - slog21x;           // distances for slog 21
    assign slog21dy = DrawY - slog21y;

	logic[7:0] slog21colorout;
	logic[7:0] slog21R, slog21G, slog21B;
	slogrom slog21(.DX(slog21dx), .DY(slog21dy), .dir(slog21dir), .data(slog21colorout));
	  color_table			slog21color(.color(slog21colorout),
												.R(slog21R),
												.G(slog21G),
												.B(slog21B));
												
		//STUFF FOR slog 22
	 int slog22dx, slog22dy;
	 assign slog22dx = DrawX - slog22x;           // distances for slog 22
    assign slog22dy = DrawY - slog22y;

	logic[7:0] slog22colorout;
	logic[7:0] slog22R, slog22G, slog22B;
	slogrom slog22(.DX(slog22dx), .DY(slog22dy), .dir(slog22dir), .data(slog22colorout));
	  color_table			slog22color(.color(slog22colorout),
												.R(slog22R),
												.G(slog22G),
												.B(slog22B));
												
		//STUFF FOR slog 23
	 int slog23dx, slog23dy;
	 assign slog23dx = DrawX - slog23x;           // distances for slog 23
    assign slog23dy = DrawY - slog23y;

	logic[7:0] slog23colorout;
	logic[7:0] slog23R, slog23G, slog23B;
	slogrom slog23(.DX(slog23dx), .DY(slog23dy), .dir(slog23dir), .data(slog23colorout));
	  color_table			slog23color(.color(slog23colorout),
												.R(slog23R),
												.G(slog23G),
												.B(slog23B));
												
		//STUFF FOR slog 24
	 int slog24dx, slog24dy;
	 assign slog24dx = DrawX - slog24x;           // distances for slog 24
    assign slog24dy = DrawY - slog24y;

	logic[7:0] slog24colorout;
	logic[7:0] slog24R, slog24G, slog24B;
	slogrom slog24(.DX(slog24dx), .DY(slog24dy), .dir(slog24dir), .data(slog24colorout));
	  color_table			slog24color(.color(slog24colorout),
												.R(slog24R),
												.G(slog24G),
												.B(slog24B));
												
								
	
	
	//STUFF FOR TRUCK 1
	 int truck1dx, truck1dy;
	 assign truck1dx = DrawX - truck1x;           // distances for truck 1
    assign truck1dy = DrawY - truck1y;

	logic[7:0] truck1colorout;
	logic[7:0] truck1R, truck1G, truck1B;
	truckrom truck1(.DX(truck1dx), .DY(truck1dy), .dir(truck1dir), .data(truck1colorout));
	  color_table			truckcolor(.color(truck1colorout),
												.R(truck1R),
												.G(truck1G),
												.B(truck1B));
												
    //STUFF FOR TRUCK 2
	 int truck2dx, truck2dy;
	 assign truck2dx = DrawX - truck2x;           // distances for truck 2
    assign truck2dy = DrawY - truck2y;
	 
	logic[7:0] truck2colorout;
	logic[7:0] truck2R, truck2G, truck2B;
	truckrom truck2(.DX(truck2dx), .DY(truck2dy), .dir(truck2dir), .data(truck2colorout));
	  color_table			truck2color(.color(truck2colorout),
												.R(truck2R),
												.G(truck2G),
												.B(truck2B));
												
	 int truck3dx, truck3dy;
	 assign truck3dx = DrawX - truck3x;           // distances for truck 3
    assign truck3dy = DrawY - truck3y;

	logic[7:0] truck3colorout;
	logic[7:0] truck3R, truck3G, truck3B;
	truckrom truck3(.DX(truck3dx), .DY(truck3dy), .dir(truck3dir), .data(truck3colorout));
	  color_table			truck3color(.color(truck3colorout),
												.R(truck3R),
												.G(truck3G),
												.B(truck3B));
												
	 int truck4dx, truck4dy;
	 assign truck4dx = DrawX - truck4x;           // distances for truck 4
    assign truck4dy = DrawY - truck4y;

	logic[7:0] truck4colorout;
	logic[7:0] truck4R, truck4G, truck4B;
	truckrom truck4(.DX(truck4dx), .DY(truck4dy), .dir(truck4dir), .data(truck4colorout));
	  color_table			truck4color(.color(truck4colorout),
												.R(truck4R),
												.G(truck4G),
												.B(truck4B));
	 int truck5dx, truck5dy;
	 assign truck5dx = DrawX - truck5x;           // distances for truck 5
    assign truck5dy = DrawY - truck5y;

	logic[7:0] truck5colorout;
	logic[7:0] truck5R, truck5G, truck5B;
	truckrom truck5(.DX(truck5dx), .DY(truck5dy), .dir(truck5dir), .data(truck5colorout));
	  color_table			truck5color(.color(truck5colorout),
												.R(truck5R),
												.G(truck5G),
												.B(truck5B));
										
	 int truck6dx, truck6dy;
	 assign truck6dx = DrawX - truck6x;           // distances for truck 6
    assign truck6dy = DrawY - truck6y;

	logic[7:0] truck6colorout;
	logic[7:0] truck6R, truck6G, truck6B;
	truckrom truck6(.DX(truck6dx), .DY(truck6dy), .dir(truck6dir), .data(truck6colorout));
	  color_table			truck6color(.color(truck6colorout),
												.R(truck6R),
												.G(truck6G),
												.B(truck6B));
												
	 int truck7dx, truck7dy;
	 assign truck7dx = DrawX - truck7x;           // distances for truck 7
    assign truck7dy = DrawY - truck7y;

	logic[7:0] truck7colorout;
	logic[7:0] truck7R, truck7G, truck7B;
	truckrom truck7(.DX(truck7dx), .DY(truck7dy), .dir(truck7dir), .data(truck7colorout));
	  color_table			truck7color(.color(truck7colorout),
												.R(truck7R),
												.G(truck7G),
												.B(truck7B));
												
	 int truck8dx, truck8dy;
	 assign truck8dx = DrawX - truck8x;           // distances for truck 8
    assign truck8dy = DrawY - truck8y;

	logic[7:0] truck8colorout;
	logic[7:0] truck8R, truck8G, truck8B;
	truckrom truck8(.DX(truck8dx), .DY(truck8dy), .dir(truck8dir), .data(truck8colorout));
	  color_table			truck8color(.color(truck8colorout),
												.R(truck8R),
												.G(truck8G),
												.B(truck8B));
	
//------------------------------CARLEFT
    //STUFF FOR carleft1
	 int carleft1dx, carleft1dy;
	 assign carleft1dx = DrawX - carleft1x;           // distances for car left
    assign carleft1dy = DrawY - carleft1y;
	 
	logic[7:0] carleft1colorout;
	logic[7:0] carleft1R, carleft1G, carleft1B;
	carleftrom carleft1(.DX(carleft1dx), .DY(carleft1dy), .dir(carleft1dir), .data(carleft1colorout));
	  color_table			carleft1color(.color(carleft1colorout),
												.R(carleft1R),
												.G(carleft1G),
												.B(carleft1B));
												
	    //STUFF FOR carleft2
	 int carleft2dx, carleft2dy;
	 assign carleft2dx = DrawX - carleft2x;           // distances for car left
    assign carleft2dy = DrawY - carleft2y;
	 
	logic[7:0] carleft2colorout;
	logic[7:0] carleft2R, carleft2G, carleft2B;
	carleftrom carleft2(.DX(carleft2dx), .DY(carleft2dy), .dir(carleft2dir), .data(carleft2colorout));
	  color_table			carleft2color(.color(carleft2colorout),
												.R(carleft2R),
												.G(carleft2G),
												.B(carleft2B));
		 //STUFF FOR carleft3									
		 int carleft3dx, carleft3dy;
	 assign carleft3dx = DrawX - carleft3x;           // distances for car left
    assign carleft3dy = DrawY - carleft3y;
	 
	logic[7:0] carleft3colorout;
	logic[7:0] carleft3R, carleft3G, carleft3B;
	carleftrom carleft3(.DX(carleft3dx), .DY(carleft3dy), .dir(carleft3dir), .data(carleft3colorout));
	  color_table			carleft3color(.color(carleft3colorout),
												.R(carleft3R),
												.G(carleft3G),
												.B(carleft3B));
												
	    //STUFF FOR carleft4
	 int carleft4dx, carleft4dy;
	 assign carleft4dx = DrawX - carleft4x;           // distances for car left
    assign carleft4dy = DrawY - carleft4y;
	 
	logic[7:0] carleft4colorout;
	logic[7:0] carleft4R, carleft4G, carleft4B;
	carleftrom carleft4(.DX(carleft4dx), .DY(carleft4dy), .dir(carleft4dir), .data(carleft4colorout));
	  color_table			carleft4color(.color(carleft4colorout),
												.R(carleft4R),
												.G(carleft4G),
												.B(carleft4B));
		 //STUFF FOR carleft5						
		 int carleft5dx, carleft5dy;
	 assign carleft5dx = DrawX - carleft5x;           // distances for car left
    assign carleft5dy = DrawY - carleft5y;
	 
	logic[7:0] carleft5colorout;
	logic[7:0] carleft5R, carleft5G, carleft5B;
	carleftrom carleft5(.DX(carleft5dx), .DY(carleft5dy), .dir(carleft5dir), .data(carleft5colorout));
	  color_table			carleft5color(.color(carleft5colorout),
												.R(carleft5R),
												.G(carleft5G),
												.B(carleft5B));
												
	    //STUFF FOR carleft6
	 int carleft6dx, carleft6dy;
	 assign carleft6dx = DrawX - carleft6x;           // distances for car left
    assign carleft6dy = DrawY - carleft6y;
	 
	logic[7:0] carleft6colorout;
	logic[7:0] carleft6R, carleft6G, carleft6B;
	carleftrom carleft6(.DX(carleft6dx), .DY(carleft6dy), .dir(carleft6dir), .data(carleft6colorout));
	  color_table			carleft6color(.color(carleft6colorout),
												.R(carleft6R),
												.G(carleft6G),
												.B(carleft6B));
												
//------------------------END CAR LEFT

//------------------------START CAR RIGHT
	   //STUFF FOR carright1
	 int carright1dx, carright1dy;
	 assign carright1dx = DrawX - carright1x;           // distances for car right
    assign carright1dy = DrawY - carright1y;
	 
	logic[7:0] carright1colorout;
	logic[7:0] carright1R, carright1G, carright1B;
	carrightrom carright1(.DX(carright1dx), .DY(carright1dy), .dir(carright1dir), .data(carright1colorout));
	  color_table			carright1color(.color(carright1colorout),
												.R(carright1R),
												.G(carright1G),
												.B(carright1B));
	int carright2dx, carright2dy;
	 assign carright2dx = DrawX - carright2x;           // distances for car right
    assign carright2dy = DrawY - carright2y;
	 
	logic[7:0] carright2colorout;
	logic[7:0] carright2R, carright2G, carright2B;
	carrightrom carright2(.DX(carright2dx), .DY(carright2dy), .dir(carright2dir), .data(carright2colorout));
	  color_table			carright2color(.color(carright2colorout),
												.R(carright2R),
												.G(carright2G),
												.B(carright2B));
	
		 int carright3dx, carright3dy;
	 assign carright3dx = DrawX - carright3x;           // distances for car right
    assign carright3dy = DrawY - carright3y;
	 
	logic[7:0] carright3colorout;
	logic[7:0] carright3R, carright3G, carright3B;
	carrightrom carright3(.DX(carright3dx), .DY(carright3dy), .dir(carright3dir), .data(carright3colorout));
	  color_table			carright3color(.color(carright3colorout),
												.R(carright3R),
												.G(carright3G),
												.B(carright3B));
	int carright4dx, carright4dy;
	 assign carright4dx = DrawX - carright4x;           // distances for car right
    assign carright4dy = DrawY - carright4y;
	 
	logic[7:0] carright4colorout;
	logic[7:0] carright4R, carright4G, carright4B;
	carrightrom carright4(.DX(carright4dx), .DY(carright4dy), .dir(carright4dir), .data(carright4colorout));
	  color_table			carright4color(.color(carright4colorout),
												.R(carright4R),
												.G(carright4G),
												.B(carright4B));
							
		 int carright5dx, carright5dy;
	 assign carright5dx = DrawX - carright5x;           // distances for car right
    assign carright5dy = DrawY - carright5y;
	 
	logic[7:0] carright5colorout;
	logic[7:0] carright5R, carright5G, carright5B;
	carrightrom carright5(.DX(carright5dx), .DY(carright5dy), .dir(carright5dir), .data(carright5colorout));
	  color_table			carright5color(.color(carright5colorout),
												.R(carright5R),
												.G(carright5G),
												.B(carright5B));
	int carright6dx, carright6dy;
	 assign carright6dx = DrawX - carright6x;           // distances for car right
    assign carright6dy = DrawY - carright6y;
	 
	logic[7:0] carright6colorout;
	logic[7:0] carright6R, carright6G, carright6B;
	carrightrom carright6(.DX(carright6dx), .DY(carright6dy), .dir(carright6dir), .data(carright6colorout));
	  color_table			carright6color(.color(carright6colorout),
												.R(carright6R),
												.G(carright6G),
												.B(carright6B));
												
		 int carright7dx, carright7dy;
	 assign carright7dx = DrawX - carright7x;           // distances for car right
    assign carright7dy = DrawY - carright7y;
	 
	logic[7:0] carright7colorout;
	logic[7:0] carright7R, carright7G, carright7B;
	carrightrom carright7(.DX(carright7dx), .DY(carright7dy), .dir(carright7dir), .data(carright7colorout));
	  color_table			carright7color(.color(carright7colorout),
												.R(carright7R),
												.G(carright7G),
												.B(carright7B));
	int carright8dx, carright8dy;
	 assign carright8dx = DrawX - carright8x;           // distances for car right
    assign carright8dy = DrawY - carright8y;
	 
	logic[7:0] carright8colorout;
	logic[7:0] carright8R, carright8G, carright8B;
	carrightrom carright8(.DX(carright8dx), .DY(carright8dy), .dir(carright8dir), .data(carright8colorout));
	  color_table			carright8color(.color(carright8colorout),
												.R(carright8R),
												.G(carright8G),
												.B(carright8B));
												
   //STUFF FOR othercarright1
	 int othercarright1dx, othercarright1dy;
	 assign othercarright1dx = DrawX - othercarright1x;           // distances for car left
    assign othercarright1dy = DrawY - othercarright1y;
	 
	logic[7:0] othercarright1colorout;
	logic[7:0] othercarright1R, othercarright1G, othercarright1B;
	othercarrightrom othercarright1(.DX(othercarright1dx), .DY(othercarright1dy), .dir(othercarright1dir), .data(othercarright1colorout));
	  color_table			othercarright1color(.color(othercarright1colorout),
												.R(othercarright1R),
												.G(othercarright1G),
												.B(othercarright1B));
												
   //STUFF FOR othercarright2
	 int othercarright2dx, othercarright2dy;
	 assign othercarright2dx = DrawX - othercarright2x;           // distances for car left
    assign othercarright2dy = DrawY - othercarright2y;
	 
	logic[7:0] othercarright2colorout;
	logic[7:0] othercarright2R, othercarright2G, othercarright2B;
	othercarrightrom othercarright2(.DX(othercarright2dx), .DY(othercarright2dy), .dir(othercarright2dir), .data(othercarright2colorout));
	  color_table			othercarright2color(.color(othercarright2colorout),
												.R(othercarright2R),
												.G(othercarright2G),
												.B(othercarright2B));
												
   //STUFF FOR othercarright3
	 int othercarright3dx, othercarright3dy;
	 assign othercarright3dx = DrawX - othercarright3x;           // distances for car left
    assign othercarright3dy = DrawY - othercarright3y;
	 
	logic[7:0] othercarright3colorout;
	logic[7:0] othercarright3R, othercarright3G, othercarright3B;
	othercarrightrom othercarright3(.DX(othercarright3dx), .DY(othercarright3dy), .dir(othercarright3dir), .data(othercarright3colorout));
	  color_table			othercarright3color(.color(othercarright3colorout),
												.R(othercarright3R),
												.G(othercarright3G),
												.B(othercarright3B));
												
   //STUFF FOR othercarright4
	 int othercarright4dx, othercarright4dy;
	 assign othercarright4dx = DrawX - othercarright4x;           // distances for car left
    assign othercarright4dy = DrawY - othercarright4y;
	 
	logic[7:0] othercarright4colorout;
	logic[7:0] othercarright4R, othercarright4G, othercarright4B;
	othercarrightrom othercarright4(.DX(othercarright4dx), .DY(othercarright4dy), .dir(othercarright4dir), .data(othercarright4colorout));
	  color_table			othercarright4color(.color(othercarright4colorout),
												.R(othercarright4R),
												.G(othercarright4G),
												.B(othercarright4B));
	

	


	  	  
	  
//    always_comb
//    begin:Ball_on_proc
//        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end 
	  
	 always_ff
    begin:pacmanJr_on_proc
			
			if (unpaused == 1'b0)
				pausedon = 1'b1;
			else
				pausedon = 1'b0;
			
        if ( BallX <= DrawX && DrawX <= BallX+23 && BallY <= DrawY && DrawY <= BallY+23 && frogcolorout > 8'd0)  // changed to 15 what for frogger
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
				
			if ( 76 <= DrawX && DrawX <= 100 && 20 <= DrawY && DrawY <= 44 && pad1 == 1'b1 && conn1colorout > 8'd0)
					pad1on = 1'b1;
			else
					pad1on = 1'b0;
					
			if ( 191 <= DrawX && DrawX <= 225 && 20 <= DrawY && DrawY <= 44 && pad2 == 1'b1 && conn2colorout > 8'd0)
					pad2on = 1'b1;
			else
					pad2on = 1'b0;
					
			if ( 309 <= DrawX && DrawX <= 333 && 20 <= DrawY && DrawY<= 44 && pad3 == 1'b1 && conn3colorout > 8'd0)
					pad3on = 1'b1;
			else
					pad3on = 1'b0;
					
			if ( 425 <= DrawX && DrawX <= 449 && 20 <= DrawY && DrawY<= 44 && pad4 == 1'b1 && conn4colorout > 8'd0)
					pad4on = 1'b1;
			else
					pad4on = 1'b0;
					
			if ( 541 <= DrawX && DrawX <= 565 && 20 <= DrawY && DrawY<= 44 && pad5 == 1'b1 && conn5colorout > 8'd0)
					pad5on = 1'b1;
			else
					pad5on = 1'b0;
				
		 if (blog1x <= DrawX && DrawX <= blog1x+95 && blog1y <= DrawY && DrawY <= blog1y + 23 && blog1colorout > 8'd0)
				blog1on = 1'b1;
			else 
				blog1on = 1'b0;
			
			if (blog2x <= DrawX && DrawX <= blog2x+95 && blog2y <= DrawY && DrawY <= blog2y + 23 && blog2colorout > 8'd0)
					blog2on = 1'b1;
				else 
					blog2on = 1'b0;
				
			if (blog3x <= DrawX && DrawX <= blog3x+95 && blog3y <= DrawY && DrawY <= blog3y + 23 && blog3colorout > 8'd0)
					blog3on = 1'b1;
				else 
					blog3on = 1'b0;
				
			if (blog4x <= DrawX && DrawX <= blog4x+95 && blog4y <= DrawY && DrawY <= blog4y + 23 && blog4colorout > 8'd0)
					blog4on = 1'b1;
				else 
					blog4on = 1'b0;
				
			if (blog5x <= DrawX && DrawX <= blog5x+95 && blog5y <= DrawY && DrawY <= blog5y + 23 && blog5colorout > 8'd0)
					blog5on = 1'b1;
				else 
					blog5on = 1'b0;
				
			if (blog6x <= DrawX && DrawX <= blog6x+95 && blog6y <= DrawY && DrawY <= blog6y + 23 && blog6colorout > 8'd0)
					blog6on = 1'b1;
				else 
					blog6on = 1'b0;
				
			if (blog7x <= DrawX && DrawX <= blog7x+95 && blog7y <= DrawY && DrawY <= blog7y + 23 && blog7colorout > 8'd0)
					blog7on = 1'b1;
				else 
					blog7on = 1'b0;
				
			if (blog8x <= DrawX && DrawX <= blog8x+95 && blog8y <= DrawY && DrawY <= blog8y + 23 && blog8colorout > 8'd0)
					blog8on = 1'b1;
				else 
					blog8on = 1'b0;
				
			if (blog9x <= DrawX && DrawX <= blog9x+95 && blog9y <= DrawY && DrawY <= blog9y + 23 && blog9colorout > 8'd0)
					blog9on = 1'b1;
				else 
					blog9on = 1'b0;
				
			//small log stuff	
			if (slog1x <= DrawX && DrawX <= slog1x+47 && slog1y <= DrawY && DrawY <= slog1y + 23 && slog1colorout > 8'd0)
				slog1on = 1'b1;
			else 
				slog1on = 1'b0;
			
			if (slog2x <= DrawX && DrawX <= slog2x+47 && slog2y <= DrawY && DrawY <= slog2y + 23 && slog2colorout > 8'd0)
					slog2on = 1'b1;
				else 
					slog2on = 1'b0;
				
			if (slog3x <= DrawX && DrawX <= slog3x+47 && slog3y <= DrawY && DrawY <= slog3y + 23 && slog3colorout > 8'd0)
					slog3on = 1'b1;
				else 
					slog3on = 1'b0;
				
			if (slog4x <= DrawX && DrawX <= slog4x+47 && slog4y <= DrawY && DrawY <= slog4y + 23 && slog4colorout > 8'd0)
					slog4on = 1'b1;
				else 
					slog4on = 1'b0;
				
			if (slog5x <= DrawX && DrawX <= slog5x+47 && slog5y <= DrawY && DrawY <= slog5y + 23 && slog5colorout > 8'd0)
					slog5on = 1'b1;
				else 
					slog5on = 1'b0;
				
			if (slog6x <= DrawX && DrawX <= slog6x+47 && slog6y <= DrawY && DrawY <= slog6y + 23 && slog6colorout > 8'd0)
					slog6on = 1'b1;
				else 
					slog6on = 1'b0;
				
			if (slog7x <= DrawX && DrawX <= slog7x+47 && slog7y <= DrawY && DrawY <= slog7y + 23 && slog7colorout > 8'd0)
					slog7on = 1'b1;
				else 
					slog7on = 1'b0;
				
			if (slog8x <= DrawX && DrawX <= slog8x+47 && slog8y <= DrawY && DrawY <= slog8y + 23 && slog8colorout > 8'd0)
					slog8on = 1'b1;
				else 
					slog8on = 1'b0;
				
			if (slog9x <= DrawX && DrawX <= slog9x+47 && slog9y <= DrawY && DrawY <= slog9y + 23 && slog9colorout > 8'd0)
					slog9on = 1'b1;
				else 
					slog9on = 1'b0;
				
			if (slog10x <= DrawX && DrawX <= slog10x+47 && slog10y <= DrawY && DrawY <= slog10y + 23 && slog10colorout > 8'd0)
					slog10on = 1'b1;
				else 
					slog10on = 1'b0;
				
			if (slog11x <= DrawX && DrawX <= slog11x+47 && slog11y <= DrawY && DrawY <= slog11y + 23 && slog11colorout > 8'd0)
					slog11on = 1'b1;
				else 
					slog11on = 1'b0;
				
			if (slog12x <= DrawX && DrawX <= slog12x+47 && slog12y <= DrawY && DrawY <= slog12y + 23 && slog12colorout > 8'd0)
					slog12on = 1'b1;
				else 
					slog12on = 1'b0;
				
			if (slog13x <= DrawX && DrawX <= slog13x+47 && slog13y <= DrawY && DrawY <= slog13y + 23 && slog13colorout > 8'd0)
					slog13on = 1'b1;
				else 
					slog13on = 1'b0;
				
			if (slog14x <= DrawX && DrawX <= slog14x+47 && slog14y <= DrawY && DrawY <= slog14y + 23 && slog14colorout > 8'd0)
					slog14on = 1'b1;
				else 
					slog14on = 1'b0;
				
			if (slog15x <= DrawX && DrawX <= slog15x+47 && slog15y <= DrawY && DrawY <= slog15y + 23 && slog15colorout > 8'd0)
					slog15on = 1'b1;
				else 
					slog15on = 1'b0;
				
			if (slog16x <= DrawX && DrawX <= slog16x+47 && slog16y <= DrawY && DrawY <= slog16y + 23 && slog16colorout > 8'd0)
					slog16on = 1'b1;
				else 
					slog16on = 1'b0;
				
			if (slog17x <= DrawX && DrawX <= slog17x+47 && slog17y <= DrawY && DrawY <= slog17y + 23 && slog17colorout > 8'd0)
					slog17on = 1'b1;
				else 
					slog17on = 1'b0;
				
			if (slog18x <= DrawX && DrawX <= slog18x+47 && slog18y <= DrawY && DrawY <= slog18y + 23 && slog18colorout > 8'd0)
					slog18on = 1'b1;
				else 
					slog18on = 1'b0;
				
			if (slog19x <= DrawX && DrawX <= slog19x+47 && slog19y <= DrawY && DrawY <= slog19y + 23 && slog19colorout > 8'd0)
					slog19on = 1'b1;
				else 
					slog19on = 1'b0;
				
			if (slog20x <= DrawX && DrawX <= slog20x+47 && slog20y <= DrawY && DrawY <= slog20y + 23 && slog20colorout > 8'd0)
					slog20on = 1'b1;
				else 
					slog20on = 1'b0;
				
			if (slog21x <= DrawX && DrawX <= slog21x+47 && slog21y <= DrawY && DrawY <= slog21y + 23 && slog21colorout > 8'd0)
					slog21on = 1'b1;
				else 
					slog21on = 1'b0;
				
			if (slog22x <= DrawX && DrawX <= slog22x+47 && slog22y <= DrawY && DrawY <= slog22y + 23 && slog22colorout > 8'd0)
					slog22on = 1'b1;
				else 
					slog22on = 1'b0;
				
			if (slog23x <= DrawX && DrawX <= slog23x+47 && slog23y <= DrawY && DrawY <= slog23y + 23 && slog23colorout > 8'd0)
					slog23on = 1'b1;
				else 
					slog23on = 1'b0;
				
			if (slog24x <= DrawX && DrawX <= slog24x+47 && slog24y <= DrawY && DrawY <= slog24y + 23 && slog24colorout > 8'd0)
					slog24on = 1'b1;
				else 
					slog24on = 1'b0;	
				
			//truck nonsense	
			if (truck1x <= DrawX && DrawX <= truck1x+47 && truck1y <= DrawY && DrawY <= truck1y + 23 && truck1colorout > 8'd0)
				truck1on = 1'b1;
			else 
				truck1on = 1'b0;
				
			if (truck2x <= DrawX && DrawX <= truck2x+47 && truck2y <= DrawY && DrawY <= truck2y + 23 && truck2colorout > 8'd0)
				truck2on = 1'b1;
			else 
				truck2on = 1'b0;
				
			if (truck3x <= DrawX && DrawX <= truck3x+47 && truck3y <= DrawY && DrawY <= truck3y + 23 && truck3colorout > 8'd0)
				truck3on = 1'b1;
			else 
				truck3on = 1'b0;
				
			if (truck4x <= DrawX && DrawX <= truck4x+47 && truck4y <= DrawY && DrawY <= truck4y + 23 && truck4colorout > 8'd0)
				truck4on = 1'b1;
			else 
				truck4on = 1'b0;
				
			if (truck5x <= DrawX && DrawX <= truck5x+47 && truck5y <= DrawY && DrawY <= truck5y + 23 && truck5colorout > 8'd0)
				truck5on = 1'b1;
			else 
				truck5on = 1'b0;
				
			if (truck6x <= DrawX && DrawX <= truck6x+47 && truck6y <= DrawY && DrawY <= truck6y + 23 && truck6colorout > 8'd0)
				truck6on = 1'b1;
			else 
				truck6on = 1'b0;
				
			if (truck7x <= DrawX && DrawX <= truck7x+47 && truck7y <= DrawY && DrawY <= truck7y + 23 && truck7colorout > 8'd0)
				truck7on = 1'b1;
			else 
				truck7on = 1'b0;
				
			if (truck8x <= DrawX && DrawX <= truck8x+47 && truck8y <= DrawY && DrawY <= truck8y + 23 && truck8colorout > 8'd0)
				truck8on = 1'b1;
			else 
				truck8on = 1'b0;
			
			
			//car left
			if (carleft1x <= DrawX && DrawX <= carleft1x+23 && carleft1y <= DrawY && DrawY <= carleft1y + 23 && carleft1colorout > 8'd0)
				carleft1on = 1'b1;
				
			else 
				carleft1on = 1'b0;
				
			if (carleft2x <= DrawX && DrawX <= carleft2x+23 && carleft2y <= DrawY && DrawY <= carleft2y + 23 && carleft2colorout > 8'd0)
				carleft2on = 1'b1;
			else 
				carleft2on = 1'b0;
				
			if (carleft3x <= DrawX && DrawX <= carleft3x+23 && carleft3y <= DrawY && DrawY <= carleft3y + 23 && carleft3colorout > 8'd0)
				carleft3on = 1'b1;
			else 
				carleft3on = 1'b0;
				
			if (carleft4x <= DrawX && DrawX <= carleft4x+23 && carleft4y <= DrawY && DrawY <= carleft4y + 23 && carleft4colorout > 8'd0)
				carleft4on = 1'b1;
			else 
				carleft4on = 1'b0;
				
			if (carleft5x <= DrawX && DrawX <= carleft5x+23 && carleft5y <= DrawY && DrawY <= carleft5y + 23 && carleft5colorout > 8'd0)
				carleft5on = 1'b1;
			else 
				carleft5on = 1'b0;
				
			if (carleft6x <= DrawX && DrawX <= carleft6x+23 && carleft6y <= DrawY && DrawY <= carleft6y + 23 && carleft6colorout > 8'd0)
				carleft6on = 1'b1;
			else 
				carleft6on = 1'b0;
				
				
			//carright
			if (carright1x <= DrawX && DrawX <= carright1x+23 && carright1y <= DrawY && DrawY <= carright1y + 23 && carright1colorout > 8'd0)
				carright1on = 1'b1;
			else 
				carright1on = 1'b0;
				
			if (carright2x <= DrawX && DrawX <= carright2x+23 && carright2y <= DrawY && DrawY <= carright2y + 23 && carright2colorout > 8'd0)
				carright2on = 1'b1;
			else 
				carright2on = 1'b0;
				
			if (carright3x <= DrawX && DrawX <= carright3x+23 && carright3y <= DrawY && DrawY <= carright3y + 23 && carright3colorout > 8'd0)
				carright3on = 1'b1;
			else 
				carright3on = 1'b0;
				
			if (carright4x <= DrawX && DrawX <= carright4x+23 && carright4y <= DrawY && DrawY <= carright4y + 23 && carright4colorout > 8'd0)
				carright4on = 1'b1;
			else 
				carright4on = 1'b0;
				
			if (carright5x <= DrawX && DrawX <= carright5x+23 && carright5y <= DrawY && DrawY <= carright5y + 23 && carright5colorout > 8'd0)
				carright5on = 1'b1;
			else 
				carright5on = 1'b0;
				
			if (carright5x <= DrawX && DrawX <= carright5x+23 && carright5y <= DrawY && DrawY <= carright5y + 23 && carright5colorout > 8'd0)
				carright5on = 1'b1;
			else 
				carright5on = 1'b0;
				
			if (carright6x <= DrawX && DrawX <= carright6x+23 && carright6y <= DrawY && DrawY <= carright6y + 23 && carright6colorout > 8'd0)
				carright6on = 1'b1;
			else 
				carright6on = 1'b0;
				
			if (carright7x <= DrawX && DrawX <= carright7x+23 && carright7y <= DrawY && DrawY <= carright7y + 23 && carright7colorout > 8'd0)
				carright7on = 1'b1;
			else 
				carright7on = 1'b0;
				
			if (carright8x <= DrawX && DrawX <= carright8x+23 && carright8y <= DrawY && DrawY <= carright8y + 23 && carright8colorout > 8'd0)
				carright8on = 1'b1;
			else 
				carright8on = 1'b0;
				
			if (othercarright1x <= DrawX && DrawX <= othercarright1x+23 && othercarright1y <= DrawY && DrawY <= othercarright1y + 23 && othercarright1colorout > 8'd0)
				othercarright1on = 1'b1;
			else 
				othercarright1on = 1'b0;
				
			if (othercarright2x <= DrawX && DrawX <= othercarright2x+23 && othercarright2y <= DrawY && DrawY <= othercarright2y + 23 && othercarright2colorout > 8'd0)
				othercarright2on = 1'b1;
			else 
				othercarright2on = 1'b0;
				
			if (othercarright3x <= DrawX && DrawX <= othercarright3x+23 && othercarright3y <= DrawY && DrawY <= othercarright3y + 23 && othercarright3colorout > 8'd0)
				othercarright3on = 1'b1;
			else 
				othercarright3on = 1'b0;
				
			if (othercarright4x <= DrawX && DrawX <= othercarright4x+23 && othercarright4y <= DrawY && DrawY <= othercarright4y + 23 && othercarright4colorout > 8'd0)
				othercarright4on = 1'b1;
			else 
				othercarright4on = 1'b0;
     end 
	  
	   //map_ROM_16 mapROM(.currX(DrawX), .currY(DrawY), .outR(mapR), .outG(mapG), .outB(mapB));
       
    always_ff
    begin:RGB_Display
			
			if (pausedon == 1'b1)
				begin
				Red = screenR;
					Green = screenG;
					Blue = screenB;
			end
			
        else if (ball_on == 1'b1) 
        begin
					
					Red = Rfrog;
					Green = Gfrog;
					Blue = Bfrog;
			end
			
			else if (blog1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog1R;
					Green = blog1G;
					Blue = blog1B;

			end
			
			else if (blog2on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog2R;
					Green = blog2G;
					Blue = blog2B;

			end
			
			else if (blog3on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog3R;
					Green = blog3G;
					Blue = blog3B;

			end
			
			else if (blog4on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog4R;
					Green = blog4G;
					Blue = blog4B;

			end
			
			else if (blog5on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog5R;
					Green = blog5G;
					Blue = blog5B;

			end
			
			else if (blog6on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog6R;
					Green = blog6G;
					Blue = blog6B;

			end
			
			else if (blog7on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog7R;
					Green = blog7G;
					Blue = blog7B;

			end
			
			else if (blog8on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog8R;
					Green = blog8G;
					Blue = blog8B;

			end
			
			else if (blog9on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = blog9R;
					Green = blog9G;
					Blue = blog9B;

			end
			
			//HERE COMES THE SMALL LOGS ALL 24 OF THEM
			
			else if (slog1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog1R;
					Green = slog1G;
					Blue = slog1B;

			end
			
			else if (slog24on == 1'b1)           // DRAW TRUCK 2 NO PADDING
			begin
			
				Red = slog24R;
					Green = slog24G;
					Blue = slog24B;

			end
			
			else if (slog2on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog2R;
					Green = slog2G;
					Blue = slog2B;

			end
			
			else if (slog3on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog3R;
					Green = slog3G;
					Blue = slog3B;

			end
			
			else if (slog4on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog4R;
					Green = slog4G;
					Blue = slog4B;

			end
			
			else if (slog5on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog5R;
					Green = slog5G;
					Blue = slog5B;

			end
			
			else if (slog6on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog6R;
					Green = slog6G;
					Blue = slog6B;

			end
			
			else if (slog7on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog7R;
					Green = slog7G;
					Blue = slog7B;

			end
			
			else if (slog8on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog8R;
					Green = slog8G;
					Blue = slog8B;

			end
			
			else if (slog9on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog9R;
					Green = slog9G;
					Blue = slog9B;

			end
			
			else if (slog10on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog10R;
					Green = slog10G;
					Blue = slog10B;

			end
			
			else if (slog11on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog11R;
					Green = slog11G;
					Blue = slog11B;

			end
			
			else if (slog12on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog12R;
					Green = slog12G;
					Blue = slog12B;

			end
			
			else if (slog13on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog13R;
					Green = slog13G;
					Blue = slog13B;

			end
			
			else if (slog14on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog14R;
					Green = slog14G;
					Blue = slog14B;

			end
			
			else if (slog15on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog15R;
					Green = slog15G;
					Blue = slog15B;

			end
			
			else if (slog16on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog16R;
					Green = slog16G;
					Blue = slog16B;

			end
			
			else if (slog17on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog17R;
					Green = slog17G;
					Blue = slog17B;

			end
			
			else if (slog18on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog18R;
					Green = slog18G;
					Blue = slog18B;

			end
			
			else if (slog19on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog19R;
					Green = slog19G;
					Blue = slog19B;

			end
			
			else if (slog20on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog20R;
					Green = slog20G;
					Blue = slog20B;

			end
			
			else if (slog21on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog21R;
					Green = slog21G;
					Blue = slog21B;

			end
			
			else if (slog22on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog22R;
					Green = slog22G;
					Blue = slog22B;

			end
			
			else if (slog23on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = slog23R;
					Green = slog23G;
					Blue = slog23B;

			end
			
			else if (truck1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck1R;
					Green = truck1G;
					Blue = truck1B;

			end
             
				 
			else if (truck2on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck2R;
					Green = truck2G;
					Blue = truck2B;

			end
			
			else if (truck3on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck3R;
					Green = truck3G;
					Blue = truck3B;

			end
			
			else if (truck4on == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			
				Red = truck4R;
					Green = truck4G;
					Blue = truck4B;

			end
			
			else if (truck5on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck5R;
					Green = truck5G;
					Blue = truck5B;

			end
			
			else if (truck6on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck6R;
					Green = truck6G;
					Blue = truck6B;

			end
			
			else if (truck7on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck7R;
					Green = truck7G;
					Blue = truck7B;

			end
			
			else if (truck8on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = truck8R;
					Green = truck8G;
					Blue = truck8B;

			end
			//------------------CAR LEFT
			else if (carleft1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = carleft1R;
					Green = carleft1G;
					Blue = carleft1B;

			end
			
			else if (carleft2on == 1'b1)           // DRAW TRUCK 2 NO PADDING
			begin
			
				Red = carleft2R;
					Green = carleft2G;
					Blue = carleft2B;

			end
			
			else if (carleft3on == 1'b1)           // DRAW TRUCK 3 NO PADDING
			begin
			
				Red = carleft3R;
					Green = carleft3G;
					Blue = carleft3B;

			end
			
			else if (carleft4on == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			
				Red = carleft4R;
					Green = carleft4G;
					Blue = carleft4B;

			end
			
			else if (carleft5on == 1'b1)           // DRAW TRUCK 5 NO PADDING
			begin
			
				Red = carleft5R;
					Green = carleft5G;
					Blue = carleft5B;

			end
			
			else if (carleft6on == 1'b1)           // DRAW TRUCK 6 NO PADDING
			begin
			
				Red = carleft6R;
					Green = carleft6G;
					Blue = carleft6B;

			end
			
			//-----------------CAR RIGHT
			else if (carright1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = carright1R;
					Green = carright1G;
					Blue = carright1B;

			end
			
			else if (carright2on == 1'b1)           // DRAW TRUCK 2 NO PADDING
			begin
			
				Red = carright2R;
					Green = carright2G;
					Blue = carright2B;

			end
			
			else if (carright3on == 1'b1)           // DRAW TRUCK 3 NO PADDING
			begin
			
				Red = carright3R;
					Green = carright3G;
					Blue = carright3B;

			end
			
			else if (carright4on == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			
				Red = carright4R;
					Green = carright4G;
					Blue = carright4B;

			end
			
			else if (carright5on == 1'b1)           // DRAW TRUCK 5 NO PADDING
			begin
			
				Red = carright5R;
					Green = carright5G;
					Blue = carright5B;

			end
			
			else if (carright6on == 1'b1)           // DRAW TRUCK 6 NO PADDING
			begin
			
				Red = carright6R;
					Green = carright6G;
					Blue = carright6B;

			end
			
			else if (carright7on == 1'b1)           // DRAW TRUCK 7 NO PADDING
			begin
			
				Red = carright7R;
					Green = carright7G;
					Blue = carright7B;

			end
			
			else if (carright8on == 1'b1)           // DRAW TRUCK 8 NO PADDING
			begin
			
				Red = carright8R;
					Green = carright8G;
					Blue = carright8B;

			end
			
			else if (othercarright1on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = othercarright1R;
					Green = othercarright1G;
					Blue = othercarright1B;

			end
			
			else if (othercarright2on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = othercarright2R;
					Green = othercarright2G;
					Blue = othercarright2B;

			end
			
			else if (othercarright3on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = othercarright3R;
					Green = othercarright3G;
					Blue = othercarright3B;

			end
			
			else if (othercarright4on == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			
				Red = othercarright4R;
					Green = othercarright4G;
					Blue = othercarright4B;

			end
			
			else if (pad1on == 1'b1)
			begin
				Red = conn1R; 
				Green = conn1G;
				Blue = conn1B;
			end
			
			else if (pad2on == 1'b1)
			begin
				Red = conn2R; 
				Green = conn2G;
				Blue = conn2B;
			end
			
			else if (pad3on == 1'b1)
			begin
				Red = conn3R; 
				Green = conn3G;
				Blue = conn3B;
			end
			
			else if (pad4on == 1'b1)
			begin
				Red = conn4R; 
				Green = conn4G;
				Blue = conn4B;
			end
			
			else if (pad5on == 1'b1)
			begin
				Red = conn5R; 
				Green = conn5G;
				Blue = conn5B;
			end
			
			else
				begin
					Red = mapR; 
					Green = mapG;
					Blue = mapB;
					
				end
			
         //if (ball_on == 1'b0  &&  truck1on == 1'b0)     // if no sprite here
			
			  
    end 
    
endmodule
