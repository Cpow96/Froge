//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  lab8 		( input         CLOCK_50,
                       input[3:0]    KEY, //bit 0 is set up as Reset
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, //HEX5, HEX6, HEX7,
							  //output [8:0]  LEDG,
							  //output [17:0] LEDR,
							  // VGA Interface 
                       output [7:0]  VGA_R,					//VGA Red
							                VGA_G,					//VGA Green
												 VGA_B,					//VGA Blue
							  output        VGA_CLK,				//VGA Clock
							                VGA_SYNC_N,			//VGA Sync signal
												 VGA_BLANK_N,			//VGA Blank signal
												 VGA_VS,					//VGA virtical sync signal	
												 VGA_HS,					//VGA horizontal sync signal
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output        OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output [12:0] DRAM_ADDR,				// SDRAM Address 13 Bits
							  inout [31:0]  DRAM_DQ,				// SDRAM Data 32 Bits
							  output [1:0]  DRAM_BA,				// SDRAM Bank Address 2 Bits
							  output [3:0]  DRAM_DQM,				// SDRAM Data Mast 4 Bits
							  output			 DRAM_RAS_N,			// SDRAM Row Address Strobe
							  output			 DRAM_CAS_N,			// SDRAM Column Address Strobe
							  output			 DRAM_CKE,				// SDRAM Clock Enable
							  output			 DRAM_WE_N,				// SDRAM Write Enable
							  output			 DRAM_CS_N,				// SDRAM Chip Select
							  output			 DRAM_CLK				// SDRAM Clock
											);
    
    logic Reset_h, vssig, Clk;
    logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	 logic [15:0] keycode;
	 logic CLOCK_25;
	 logic vs_wire, hs_wire, blank_wire, sync_wire;
	  
	 assign Clk = CLOCK_50;
    assign {Reset_h}=~ (KEY[0]);  // The push buttons are active low
	 
	 assign VGA_CLK = CLOCK_25;
	 assign VGA_SYNC_N = sync_wire;
	 assign VGA_BLANK_N = blank_wire;
	 assign VGA_VS = vs_wire;
	 assign VGA_HS = hs_wire;
	 
	 wire [1:0] hpi_addr;
	 wire [15:0] hpi_data_in, hpi_data_out;
	 wire hpi_r, hpi_w,hpi_cs;
	 
	 wire [2:0] direction;             // frogger's direction
	 
	 hpi_io_intf hpi_io_inst(   .from_sw_address(hpi_addr),
										 .from_sw_data_in(hpi_data_in),
										 .from_sw_data_out(hpi_data_out),
										 .from_sw_r(hpi_r),
										 .from_sw_w(hpi_w),
										 .from_sw_cs(hpi_cs),
		 								 .OTG_DATA(OTG_DATA),    
										 .OTG_ADDR(OTG_ADDR),    
										 .OTG_RD_N(OTG_RD_N),    
										 .OTG_WR_N(OTG_WR_N),    
										 .OTG_CS_N(OTG_CS_N),    
										 .OTG_RST_N(OTG_RST_N),   
										 .OTG_INT(OTG_INT),
										 .Clk(Clk),
										 .Reset(Reset_h)
	 );
	 
	 //The connections for nios_system might be named different depending on how you set up Qsys
	 lab8_soc nios_system(
										 .clk_clk(Clk),         
										 .reset_reset_n(KEY[0]),   
										 .sdram_wire_addr(DRAM_ADDR), 
										 .sdram_wire_ba(DRAM_BA),   
										 .sdram_wire_cas_n(DRAM_CAS_N),
										 .sdram_wire_cke(DRAM_CKE),  
										 .sdram_wire_cs_n(DRAM_CS_N), 
										 .sdram_wire_dq(DRAM_DQ),   
										 .sdram_wire_dqm(DRAM_DQM),  
										 .sdram_wire_ras_n(DRAM_RAS_N),
										 .sdram_wire_we_n(DRAM_WE_N), 
										 .sdram_clk_clk(DRAM_CLK),
										 .keycode_export(keycode),  
										 .otg_hpi_address_export(hpi_addr),
										 .otg_hpi_data_in_port(hpi_data_in),
										 .otg_hpi_data_out_port(hpi_data_out),
										 .otg_hpi_cs_export(hpi_cs),
										 .otg_hpi_r_export(hpi_r),
										 .otg_hpi_w_export(hpi_w));
	
	//Fill in the connections for the rest of the modules 
    vga_controller vgasync_instance(.Clk, .Reset(Reset_h), .hs(hs_wire), .vs(vs_wire), .pixel_clk(CLOCK_25), 
												.blank(blank_wire), .sync(sync_wire), .DrawX(drawxsig), .DrawY(drawysig));

//module  vga_controller ( input        Clk,       // 50 MHz clock
//                                      Reset,     // reset signal
//                         output logic hs,        // Horizontal sync pulse.  Active low
//								              vs,        // Vertical sync pulse.  Active low
//												  pixel_clk, // 25 MHz pixel clock output
//												  blank,     // Blanking interval indicator.  Active low.
//												  sync,      // Composite Sync signal.  Active low.  We don't use it in this lab,
//												             //   but the video DAC on the DE2 board requires an input for it.
//								 output [9:0] DrawX,     // horizontal coordinate
//								              DrawY );   // vertical coordinate

	logic unpausedwire, manualwire;


    ball ball_instance(.Reset(Reset_h), .frame_clk(vs_wire), .dead(deadwire), .win(winwire), .rightlog(rightlogwire), .wall(wallwire), .leftlog(leftlogwire), .KEYCODE(keycode[7:0]), 
	 .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig), 
	 .direction(direction), .counter(dircounter), .unpaused(unpausedwire),
	 .manualreset(manualwire));
	 
	 int conn1xwire, conn1ywire,
	 conn2xwire, conn2ywire,
	 conn3xwire, conn3ywire,
	 conn4xwire, conn4ywire,
	 conn5xwire, conn5ywire;
	 
	 /*
	 conn conn_instance(.Reset(Reset_h), .frame_clk(vs_wire), .win(winwire),
	 .conn1x(conn1xwire), .conn1y(conn1ywire),
	 .conn2x(conn2xwire), .conn2y(conn2ywire),
	 .conn3x(conn3xwire), .conn3y(conn3ywire),
	 .conn4x(conn4xwire), .conn4y(conn4ywire),
	 .conn5x(conn5xwire), .conn5y(conn5ywire),
	 .pad1(pad1wire), .pad2(pad2wire), .pad3(pad3wire), .pad4(pad4wire), .pad5(pad5wire),
	 );
	 */
	 
	 int blog1xwire, blog1ywire, blog1dirwire,
	 blog2xwire, blog2ywire, blog2dirwire,
	 blog3xwire, blog3ywire, blog3dirwire,
	 blog4xwire, blog4ywire, blog4dirwire,
	 blog5xwire, blog5ywire, blog5dirwire,
	 blog6xwire, blog6ywire, blog6dirwire,
	 blog7xwire, blog7ywire, blog7dirwire,
	 blog8xwire, blog8ywire, blog8dirwire,
	 blog9xwire, blog9ywire, blog9dirwire;
	 
	 blog blog_instance(.Reset(Reset_h || manualwire), .frame_clk(vs_wire && unpausedwire),
			.blog1x(blog1xwire), .blog1y(blog1ywire), .blog1dir(blog1dirwire),
			.blog2x(blog2xwire), .blog2y(blog2ywire), .blog2dir(blog2dirwire),
			.blog3x(blog3xwire), .blog3y(blog3ywire), .blog3dir(blog3dirwire),
			.blog4x(blog4xwire), .blog4y(blog4ywire), .blog4dir(blog4dirwire),
			.blog5x(blog5xwire), .blog5y(blog5ywire), .blog5dir(blog5dirwire),
			.blog6x(blog6xwire), .blog6y(blog6ywire), .blog6dir(blog6dirwire),
			.blog7x(blog7xwire), .blog7y(blog7ywire), .blog7dir(blog7dirwire),
			.blog8x(blog8xwire), .blog8y(blog8ywire), .blog8dir(blog8dirwire),
			.blog9x(blog9xwire), .blog9y(blog9ywire), .blog9dir(blog9dirwire));

	 int slog24xwire, slog24ywire, slog24dirwire,
	 slog1xwire, slog1ywire, slog1dirwire,
	 slog2xwire, slog2ywire, slog2dirwire,
	 slog3xwire, slog3ywire, slog3dirwire,
	 slog4xwire, slog4ywire, slog4dirwire,
	 slog5xwire, slog5ywire, slog5dirwire,
	 slog6xwire, slog6ywire, slog6dirwire,
	 slog7xwire, slog7ywire, slog7dirwire,
	 slog8xwire, slog8ywire, slog8dirwire,
	 slog9xwire, slog9ywire, slog9dirwire,
	 slog10xwire, slog10ywire, slog10dirwire,
	 slog11xwire, slog11ywire, slog11dirwire,
	 slog12xwire, slog12ywire, slog12dirwire,
	 slog13xwire, slog13ywire, slog13dirwire,
	 slog14xwire, slog14ywire, slog14dirwire,
	 slog15xwire, slog15ywire, slog15dirwire,
	 slog16xwire, slog16ywire, slog16dirwire,
	 slog17xwire, slog17ywire, slog17dirwire,
	 slog18xwire, slog18ywire, slog18dirwire,
	 slog19xwire, slog19ywire, slog19dirwire,
	 slog20xwire, slog20ywire, slog20dirwire,
	 slog21xwire, slog21ywire, slog21dirwire,
	 slog22xwire, slog22ywire, slog22dirwire,
	 slog23xwire, slog23ywire, slog23dirwire;
	 
	 slog slog_instance(.Reset(Reset_h || manualwire), .frame_clk(vs_wire&& unpausedwire),
			.slog1x(slog1xwire), .slog1y(slog1ywire), .slog1dir(slog1dirwire),
			.slog2x(slog2xwire), .slog2y(slog2ywire), .slog2dir(slog2dirwire),
			.slog3x(slog3xwire), .slog3y(slog3ywire), .slog3dir(slog3dirwire),
			.slog4x(slog4xwire), .slog4y(slog4ywire), .slog4dir(slog4dirwire),
			.slog5x(slog5xwire), .slog5y(slog5ywire), .slog5dir(slog5dirwire),
			.slog6x(slog6xwire), .slog6y(slog6ywire), .slog6dir(slog6dirwire),
			.slog7x(slog7xwire), .slog7y(slog7ywire), .slog7dir(slog7dirwire),
			.slog8x(slog8xwire), .slog8y(slog8ywire), .slog8dir(slog8dirwire),
			.slog9x(slog9xwire), .slog9y(slog9ywire), .slog9dir(slog9dirwire),
			.slog10x(slog10xwire), .slog10y(slog10ywire), .slog10dir(slog10dirwire),
			.slog11x(slog11xwire), .slog11y(slog11ywire), .slog11dir(slog11dirwire),
			.slog12x(slog12xwire), .slog12y(slog12ywire), .slog12dir(slog12dirwire),
			.slog13x(slog13xwire), .slog13y(slog13ywire), .slog13dir(slog13dirwire),
			.slog14x(slog14xwire), .slog14y(slog14ywire), .slog14dir(slog14dirwire),
			.slog15x(slog15xwire), .slog15y(slog15ywire), .slog15dir(slog15dirwire),
			.slog16x(slog16xwire), .slog16y(slog16ywire), .slog16dir(slog16dirwire),
			.slog17x(slog17xwire), .slog17y(slog17ywire), .slog17dir(slog17dirwire),
			.slog18x(slog18xwire), .slog18y(slog18ywire), .slog18dir(slog18dirwire),
			.slog19x(slog19xwire), .slog19y(slog19ywire), .slog19dir(slog19dirwire),
			.slog20x(slog20xwire), .slog20y(slog20ywire), .slog20dir(slog20dirwire),
			.slog21x(slog21xwire), .slog21y(slog21ywire), .slog21dir(slog21dirwire),
			.slog22x(slog22xwire), .slog22y(slog22ywire), .slog22dir(slog22dirwire),
			.slog23x(slog23xwire), .slog23y(slog23ywire), .slog23dir(slog23dirwire),
			.slog24x(slog24xwire), .slog24y(slog24ywire), .slog24dir(slog24dirwire),);
	 
	 ///INSTANCE FOR TRUCK-TYPE VEHICLES
	 int truck1xwire, truck1ywire,
		  truck2xwire, truck2ywire,
		  truck3xwire, truck3ywire,
		  truck4xwire, truck4ywire,
		  truck5xwire, truck5ywire,
		  truck6xwire, truck6ywire,
		  truck7xwire, truck7ywire,
		  truck8xwire, truck8ywire;      //wires to manually do all truck shit
	 logic truck1dirwire,
			 truck2dirwire,
			 truck3dirwire,
			 truck4dirwire,
			 truck5dirwire,
			 truck6dirwire,
			 truck7dirwire,
			 truck8dirwire;
	trucks trucks_instance (.Reset(Reset_h || manualwire), .frame_clk(vs_wire&& unpausedwire),
               .truck1x(truck1xwire), .truck1y(truck1ywire),
					.truck2x(truck2xwire), .truck2y(truck2ywire), 
				   .truck3x(truck3xwire), .truck3y(truck3ywire), 
				   .truck4x(truck4xwire), .truck4y(truck4ywire), 
				   .truck5x(truck5xwire), .truck5y(truck5ywire), 
				   .truck6x(truck6xwire), .truck6y(truck6ywire), 
				   .truck7x(truck7xwire), .truck7y(truck7ywire), 
				   .truck8x(truck8xwire), .truck8y(truck8ywire), 	
					.truck1dir(truck1dirwire),
					.truck2dir(truck2dirwire),
					.truck3dir(truck3dirwire),
					.truck4dir(truck4dirwire),
					.truck5dir(truck5dirwire),
					.truck6dir(truck6dirwire),
					.truck7dir(truck7dirwire),
					.truck8dir(truck8dirwire));
	
	//instance for car related stuff
	int carleft1xwire, carleft1ywire,
	carleft2xwire, carleft2ywire, 
	carleft3xwire, carleft3ywire, 
	carleft4xwire, carleft4ywire, 
	carleft5xwire, carleft5ywire, 
	carleft6xwire, carleft6ywire, 
	carright1xwire, carright1ywire, 
	carright2xwire, carright2ywire, 
	carright3xwire, carright3ywire, 
	carright4xwire, carright4ywire, 
	carright5xwire, carright5ywire,
	carright6xwire, carright6ywire, 
	carright7xwire, carright7ywire, 
	carright8xwire, carright8ywire, 
	
	othercarright1xwire, othercarright1ywire,
	othercarright2xwire, othercarright2ywire,
	othercarright3xwire, othercarright3ywire,
	othercarright4xwire, othercarright4ywire;      //wires to manually do all car shit
	logic carleft1dir, 
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
	othercarright4dir;
	carleft carleft_instance (.Reset(Reset_h || manualwire), .frame_clk(vs_wire&& unpausedwire),
               .carleft1x(carleft1xwire), .carleft1y(carleft1ywire),
					.carleft1dir(carleft1dirwire),
					.carleft2x(carleft2xwire), .carleft2y(carleft2ywire),
					.carleft2dir(carleft2dirwire),
					.carleft3x(carleft3xwire), .carleft3y(carleft3ywire),
					.carleft3dir(carleft3dirwire),
					.carleft4x(carleft4xwire), .carleft4y(carleft4ywire),
					.carleft4dir(carleft4dirwire),
					.carleft5x(carleft5xwire), .carleft5y(carleft5ywire),
					.carleft5dir(carleft5dirwire),
					.carleft6x(carleft6xwire), .carleft6y(carleft6ywire),
					.carleft6dir(carleft6dirwire)
	);
	carright carright_instance (.Reset(Reset_h || manualwire), .frame_clk(vs_wire&& unpausedwire),
	.carright1x(carright1xwire), .carright1y(carright1ywire), .carright1dir(carright1dirwire),
	.carright2x(carright2xwire), .carright2y(carright2ywire), .carright2dir(carright2dirwire),
	.carright3x(carright3xwire), .carright3y(carright3ywire), .carright3dir(carright3dirwire),
	.carright4x(carright4xwire), .carright4y(carright4ywire), .carright4dir(carright4dirwire),
	.carright5x(carright5xwire), .carright5y(carright5ywire), .carright5dir(carright5dirwire),
	.carright6x(carright6xwire), .carright6y(carright6ywire), .carright6dir(carright6dirwire),
	.carright7x(carright7xwire), .carright7y(carright7ywire), .carright7dir(carright7dirwire),
	.carright8x(carright8xwire), .carright8y(carright8ywire), .carright8dir(carright8dirwire)
	);
	
	othercarright othercarright_instance(.Reset(Reset_h || manualwire), .frame_clk(vs_wire && unpausedwire ),
											 .othercarright1x(othercarright1xwire), 
											 .othercarright1y(othercarright1ywire),
											 .othercarright1dir(othercarright1dirwire),
											 .othercarright2x(othercarright2xwire), 
											 .othercarright2y(othercarright2ywire),
											 .othercarright2dir(othercarright2dirwire),
											 .othercarright3x(othercarright3xwire), 
											 .othercarright3y(othercarright3ywire),
											 .othercarright3dir(othercarright3dirwire),
											 .othercarright4x(othercarright4xwire), 
											 .othercarright4y(othercarright4ywire),
											 .othercarright4dir(othercarright4dirwire)
	);
	 
	 //OVERALL COLOR MAPPER
    color_mapper color_instance(.BallX(ballxsig), .BallY(ballysig),
	.blog1x(blog1xwire), .blog1y(blog1ywire), .blog1dir(blog1dirwire),
	.blog2x(blog2xwire), .blog2y(blog2ywire), .blog2dir(blog2dirwire),
	.blog3x(blog3xwire), .blog3y(blog3ywire), .blog3dir(blog3dirwire),
	.blog4x(blog4xwire), .blog4y(blog4ywire), .blog4dir(blog4dirwire),
	.blog5x(blog5xwire), .blog5y(blog5ywire), .blog5dir(blog5dirwire),
	.blog6x(blog6xwire), .blog6y(blog6ywire), .blog6dir(blog6dirwire),
	.blog7x(blog7xwire), .blog7y(blog7ywire), .blog7dir(blog7dirwire),
	.blog8x(blog8xwire), .blog8y(blog8ywire), .blog8dir(blog8dirwire),
	.blog9x(blog9xwire), .blog9y(blog9ywire), .blog9dir(blog9dirwire),
	.slog1x(slog1xwire), .slog1y(slog1ywire), .slog1dir(slog1dirwire),
	.slog2x(slog2xwire), .slog2y(slog2ywire), .slog2dir(slog2dirwire),
	.slog3x(slog3xwire), .slog3y(slog3ywire), .slog3dir(slog3dirwire),
	.slog4x(slog4xwire), .slog4y(slog4ywire), .slog4dir(slog4dirwire),
	.slog5x(slog5xwire), .slog5y(slog5ywire), .slog5dir(slog5dirwire),
	.slog6x(slog6xwire), .slog6y(slog6ywire), .slog6dir(slog6dirwire),
	.slog7x(slog7xwire), .slog7y(slog7ywire), .slog7dir(slog7dirwire),
	.slog8x(slog8xwire), .slog8y(slog8ywire), .slog8dir(slog8dirwire),
	.slog9x(slog9xwire), .slog9y(slog9ywire), .slog9dir(slog9dirwire),
	.slog10x(slog10xwire), .slog10y(slog10ywire), .slog10dir(slog10dirwire),
	.slog11x(slog11xwire), .slog11y(slog11ywire), .slog11dir(slog11dirwire),
	.slog12x(slog12xwire), .slog12y(slog12ywire), .slog12dir(slog12dirwire),
	.slog13x(slog13xwire), .slog13y(slog13ywire), .slog13dir(slog13dirwire),
	.slog14x(slog14xwire), .slog14y(slog14ywire), .slog14dir(slog14dirwire),
	.slog15x(slog15xwire), .slog15y(slog15ywire), .slog15dir(slog15dirwire),
	.slog16x(slog16xwire), .slog16y(slog16ywire), .slog16dir(slog16dirwire),
	.slog17x(slog17xwire), .slog17y(slog17ywire), .slog17dir(slog17dirwire),
	.slog18x(slog18xwire), .slog18y(slog18ywire), .slog18dir(slog18dirwire),
	.slog19x(slog19xwire), .slog19y(slog19ywire), .slog19dir(slog19dirwire),
	.slog20x(slog20xwire), .slog20y(slog20ywire), .slog20dir(slog20dirwire),
	.slog21x(slog21xwire), .slog21y(slog21ywire), .slog21dir(slog21dirwire),
	.slog22x(slog22xwire), .slog22y(slog22ywire), .slog22dir(slog22dirwire),
	.slog23x(slog23xwire), .slog23y(slog23ywire), .slog23dir(slog23dirwire),
	.slog24x(slog24xwire), .slog24y(slog24ywire), .slog24dir(slog24dirwire),
	.truck1x(truck1xwire), .truck1y(truck1ywire), .truck1dir(truck1dirwire),
	.truck2x(truck2xwire), .truck2y(truck2ywire), .truck2dir(truck2dirwire),
	.truck3x(truck3xwire), .truck3y(truck3ywire), .truck3dir(truck3dirwire),
	.truck4x(truck4xwire), .truck4y(truck4ywire), .truck4dir(truck4dirwire),
	.truck5x(truck5xwire), .truck5y(truck5ywire), .truck5dir(truck5dirwire),
	.truck6x(truck6xwire), .truck6y(truck6ywire), .truck6dir(truck6dirwire),
	.truck7x(truck7xwire), .truck7y(truck7ywire), .truck7dir(truck7dirwire),
	.truck8x(truck8xwire), .truck8y(truck8ywire), .truck8dir(truck8dirwire),
	.carleft1x(carleft1xwire), .carleft1y(carleft1ywire), .carleft1dir(carleft1dirwire),
	.carleft2x(carleft2xwire), .carleft2y(carleft2ywire), .carleft2dir(carleft2dirwire),
	.carleft3x(carleft3xwire), .carleft3y(carleft3ywire), .carleft3dir(carleft3dirwire),
	.carleft4x(carleft4xwire), .carleft4y(carleft4ywire), .carleft4dir(carleft4dirwire),
	.carleft5x(carleft5xwire), .carleft5y(carleft5ywire), .carleft5dir(carleft5dirwire),
	.carleft6x(carleft6xwire), .carleft6y(carleft6ywire), .carleft6dir(carleft6dirwire),
	.carright1x(carright1xwire), .carright1y(carright1ywire), .carright1dir(carright1dirwire),
	.carright2x(carright2xwire), .carright2y(carright2ywire), .carright2dir(carright2dirwire),
	.carright3x(carright3xwire), .carright3y(carright3ywire), .carright3dir(carright3dirwire),
	.carright4x(carright4xwire), .carright4y(carright4ywire), .carright4dir(carright4dirwire),
	.carright5x(carright5xwire), .carright5y(carright5ywire), .carright5dir(carright5dirwire),
	.carright6x(carright6xwire), .carright6y(carright6ywire), .carright6dir(carright6dirwire),
	.carright7x(carright7xwire), .carright7y(carright7ywire), .carright7dir(carright7dirwire),
	.carright8x(carright8xwire), .carright8y(carright8ywire), .carright8dir(carright8dirwire),
	.othercarright1x(othercarright1xwire), .othercarright1y(othercarright1ywire), .othercarright1dir(othercarright1dirwire),
	.othercarright2x(othercarright2xwire), 
	 .othercarright2y(othercarright2ywire),
	 .othercarright2dir(othercarright2dirwire),
	 .othercarright3x(othercarright3xwire), 
	 .othercarright3y(othercarright3ywire),
	 .othercarright3dir(othercarright3dirwire),
	 .othercarright4x(othercarright4xwire), 
	 .othercarright4y(othercarright4ywire),
	 .othercarright4dir(othercarright4dirwire),
	 .DrawX(drawxsig), .DrawY(drawysig), 
	 .Ball_size(ballsizesig), .direction(direction),
	 .win(winwire), .unpaused(unpausedwire),
	 .pad1(pad1wire), .pad2(pad2wire), .pad3(pad3wire), .pad4(pad4wire), .pad5(pad5wire),
	 
	.Red(VGA_R), .Green(VGA_G), .Blue(VGA_B));


	
	//------------------------------------------------------------------
	//------------------------COLLISION INSTANCE------------------------
	//------------------------------------------------------------------
	
	logic deadwire, pad1wire, pad2wire, pad3wire, pad4wire, pad5wire, wallwire, winwire;
	int rightlogwire, leftlogwire, deathcountwire;

	collision collision_instance(.Reset(Reset_h || manualwire), .Clk(vs_wire && unpausedwire),
	.BallX(ballxsig), .BallY(ballysig),
	.blog1x(blog1xwire), .blog1y(blog1ywire),
	.blog2x(blog2xwire), .blog2y(blog2ywire),
	.blog3x(blog3xwire), .blog3y(blog3ywire),
	.blog4x(blog4xwire), .blog4y(blog4ywire),
	.blog5x(blog5xwire), .blog5y(blog5ywire),
	.blog6x(blog6xwire), .blog6y(blog6ywire),
	.blog7x(blog7xwire), .blog7y(blog7ywire),
	.blog8x(blog8xwire), .blog8y(blog8ywire),
	.blog9x(blog9xwire), .blog9y(blog9ywire),
	.slog1x(slog1xwire), .slog1y(slog1ywire),
	.slog2x(slog2xwire), .slog2y(slog2ywire),
	.slog3x(slog3xwire), .slog3y(slog3ywire),
	.slog4x(slog4xwire), .slog4y(slog4ywire),
	.slog5x(slog5xwire), .slog5y(slog5ywire),
	.slog6x(slog6xwire), .slog6y(slog6ywire),
	.slog7x(slog7xwire), .slog7y(slog7ywire),
	.slog8x(slog8xwire), .slog8y(slog8ywire),
	.slog9x(slog9xwire), .slog9y(slog9ywire),
	.slog10x(slog10xwire), .slog10y(slog10ywire), 
	.slog11x(slog11xwire), .slog11y(slog11ywire), 
	.slog12x(slog12xwire), .slog12y(slog12ywire), 
	.slog13x(slog13xwire), .slog13y(slog13ywire), 
	.slog14x(slog14xwire), .slog14y(slog14ywire), 
	.slog15x(slog15xwire), .slog15y(slog15ywire), 
	.slog16x(slog16xwire), .slog16y(slog16ywire), 
	.slog17x(slog17xwire), .slog17y(slog17ywire), 
	.slog18x(slog18xwire), .slog18y(slog18ywire), 
	.slog19x(slog19xwire), .slog19y(slog19ywire), 
	.slog20x(slog20xwire), .slog20y(slog20ywire), 
	.slog21x(slog21xwire), .slog21y(slog21ywire), 
	.slog22x(slog22xwire), .slog22y(slog22ywire), 
	.slog23x(slog23xwire), .slog23y(slog23ywire), 
	.slog24x(slog24xwire), .slog24y(slog24ywire), 
	.truck1x(truck1xwire), .truck1y(truck1ywire), 
	.truck2x(truck2xwire), .truck2y(truck2ywire), 
	.truck3x(truck3xwire), .truck3y(truck3ywire), 
	.truck4x(truck4xwire), .truck4y(truck4ywire), 
	.truck5x(truck5xwire), .truck5y(truck5ywire), 
	.truck6x(truck6xwire), .truck6y(truck6ywire), 
	.truck7x(truck7xwire), .truck7y(truck7ywire), 
	.truck8x(truck8xwire), .truck8y(truck8ywire), 
	.carleft1x(carleft1xwire), .carleft1y(carleft1ywire), 
	.carleft2x(carleft2xwire), .carleft2y(carleft2ywire), 
	.carleft3x(carleft3xwire), .carleft3y(carleft3ywire), 
	.carleft4x(carleft4xwire), .carleft4y(carleft4ywire), 
	.carleft5x(carleft5xwire), .carleft5y(carleft5ywire), 
	.carleft6x(carleft6xwire), .carleft6y(carleft6ywire), 
	.carright1x(carright1xwire), .carright1y(carright1ywire), 
	.carright2x(carright2xwire), .carright2y(carright2ywire), 
	.carright3x(carright3xwire), .carright3y(carright3ywire), 
	.carright4x(carright4xwire), .carright4y(carright4ywire), 
	.carright5x(carright5xwire), .carright5y(carright5ywire), 
	.carright6x(carright6xwire), .carright6y(carright6ywire), 
	.carright7x(carright7xwire), .carright7y(carright7ywire), 
	.carright8x(carright8xwire), .carright8y(carright8ywire), 
	.othercarright1x(othercarright1xwire), .othercarright1y(othercarright1ywire), 
	.othercarright2x(othercarright2xwire), 
	 .othercarright2y(othercarright2ywire),
	 
	 .othercarright3x(othercarright3xwire), 
	 .othercarright3y(othercarright3ywire),
	 
	 .othercarright4x(othercarright4xwire), 
	 .othercarright4y(othercarright4ywire),
	 .deathcount(deathcountwire),
	.Ball_size(ballsizesig), 
	.pad1(pad1wire), .pad2(pad2wire), .pad3(pad3wire), .pad4(pad4wire), .pad5(pad5wire), .wall(wallwire),
	.dead(deadwire), .win(winwire), .rightlog(rightlogwire), .leftlog(leftlogwire));
	
	
	
										  
	 HexDriver hex_inst_0 (deathcountwire[3:0], HEX0);
	 HexDriver hex_inst_1 (deathcountwire[7:4], HEX1);
	 
	 logic [7:0] dircounter; 
	 
	 HexDriver hex_inst_2 (slog10xwire[3:0], HEX2);
	 HexDriver hex_inst_3 (slog10xwire[7:4], HEX3);
	 
	 HexDriver hex_inst_4 ({3'b0,unpausedwire}, HEX4);
	 
    


endmodule
