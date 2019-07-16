module  collision ( 		input Reset, Clk,
								input        [9:0] BallX, BallY, Ball_size, 
								input int slog1x, slog1y,
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
								
                       output logic dead, pad1, pad2, pad3, pad4, pad5, wall, win,
							  output int leftlog, rightlog, deathcount);
    
    logic slog1hit, slog2hit, slog3hit, slog4hit, slog5hit, slog6hit, slog7hit, slog8hit,
	 slog9hit, slog10hit, slog11hit, slog12hit, slog13hit, slog14hit, slog15hit, slog16hit,
	 slog17hit, slog18hit, slog19hit, slog20hit, slog21hit, slog22hit, slog23hit, slog24hit,
	 blog1hit, blog2hit, blog3hit, blog4hit, blog5hit, blog6hit, blog7hit, blog8hit, blog9hit,
	 truck1hit, truck2hit, truck3hit, truck4hit, truck5hit, truck6hit, truck7hit, truck8hit, 
	 carleft1hit, carleft2hit, carleft3hit, carleft4hit, carleft5hit, carleft6hit, 
	 carright1hit, carright2hit, carright3hit, carright4hit, carright5hit, carright6hit, carright7hit, carright8hit, 
	 othercarright1hit, othercarright2hit, othercarright3hit, othercarright4hit;          // signals for if sprites are hit
	 //logic [4:0] pacROM_Addr;
	 //logic [31:0] pacROM_Data;
	 //logic [4:0] pacROM_Idx;
	 
	 //assign pacROM_Addr = DrawY - (BallY);
	 //assign pacROM_Idx = DrawX - (BallX);
	 //pacmanJr_ROM pacROM(.addr(pacROM_Addr), .data(pacROM_Data));
	 

	  
//    always_comb
//    begin:Ball_on_proc
//        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end 
	 
	 always_ff
    begin:pacmanJr_on_proc
	 
	 //trucks 1-4 go left
        
		  
		  //format:   Y, RIGHT, LEFT
		  
		  				
			//THIS IS THE PROTOTYPE FOR ALL HITS
			if (BallY == truck1y &&(BallX <= truck1x + 10'd38) && (BallX >= truck1x + ~(10'd15)+1))
            truck1hit = 1'b1 ;
        else 
				truck1hit = 1'b0;
		  
		  
		 if (BallY == truck2y &&(BallX <= truck2x + 10'd38) && (BallX >= truck2x + ~(10'd15)+1))
            truck2hit = 1'b1 ;
        else 
				truck2hit = 1'b0;
		
		if (BallY == truck3y &&(BallX <= truck3x + 10'd38) && (BallX >= truck3x + ~(10'd15)+1))
            truck3hit = 1'b1 ;
        else 
				truck3hit = 1'b0;
				
		if (BallY == truck4y &&(BallX <= truck4x + 10'd38) && (BallX >= truck4x + ~(10'd15)+1))
            truck4hit = 1'b1 ;
        else 
				truck4hit = 1'b0;
				
				//TRUCKS GOUNG RIGHT
		  
		  if (BallY == truck5y &&(BallX <= truck5x + 10'd39) && (BallX >= truck5x + ~(10'd14)+1))
            truck5hit = 1'b1 ;
        else 
				truck5hit = 1'b0;
		  
		  if (BallY == truck6y &&(BallX <= truck6x + 10'd39) && (BallX >= truck6x + ~(10'd14)+1))
            truck6hit = 1'b1 ;
        else 
				truck6hit = 1'b0;
				
		if (BallY == truck7y &&(BallX <= truck7x + 10'd39) && (BallX >= truck7x + ~(10'd14)+1))
            truck7hit = 1'b1 ;
        else 
				truck7hit = 1'b0;
				
		if (BallY == truck8y &&(BallX <= truck8x + 10'd39) && (BallX >= truck8x + ~(10'd14)+1))
            truck8hit = 1'b1 ;
        else 
				truck8hit = 1'b0;
		 
				
				
				
				
			//6 CARS LEFT	
				
		if (BallY == carleft1y &&(BallX <= carleft1x + 10'd17) && (BallX >= carleft1x + ~(10'd14)+1))
            carleft1hit = 1'b1 ;
        else 
				carleft1hit = 1'b0;
				
		if (BallY == carleft2y &&(BallX <= carleft2x + 10'd17) && (BallX >= carleft2x + ~(10'd14)+1))
            carleft2hit = 1'b1 ;
        else 
				carleft2hit = 1'b0;
		
		if (BallY == carleft3y &&(BallX <= carleft3x + 10'd17) && (BallX >= carleft3x + ~(10'd14)+1))
            carleft3hit = 1'b1 ;
        else 
				carleft3hit = 1'b0;
				
		if (BallY == carleft4y &&(BallX <= carleft4x + 10'd17) && (BallX >= carleft4x + ~(10'd14)+1))
            carleft4hit = 1'b1 ;
        else 
				carleft4hit = 1'b0;
				
		if (BallY == carleft5y &&(BallX <= carleft5x + 10'd17) && (BallX >= carleft5x + ~(10'd14)+1))
            carleft5hit = 1'b1 ;
        else 
				carleft5hit = 1'b0;
				
		if (BallY == carleft6y &&(BallX <= carleft6x + 10'd17) && (BallX >= carleft6x + ~(10'd14)+1))
            carleft6hit = 1'b1 ;
        else 
				carleft6hit = 1'b0;
		


//8 CARS GOING RIGHT


		if (BallY == carright1y &&(BallX <= carright1x + 10'd14) && (BallX >= carright1x + ~(10'd17)+1))
            carright1hit = 1'b1 ;
        else 
				carright1hit = 1'b0;
				
		if (BallY == carright2y &&(BallX <= carright2x + 10'd14) && (BallX >= carright2x + ~(10'd17)+1))
            carright2hit = 1'b1 ;
        else 
				carright2hit = 1'b0;
				
		if (BallY == carright3y &&(BallX <= carright3x + 10'd14) && (BallX >= carright3x + ~(10'd17)+1))
            carright3hit = 1'b1 ;
        else 
				carright3hit = 1'b0;
				
		if (BallY == carright4y &&(BallX <= carright4x + 10'd14) && (BallX >= carright4x + ~(10'd17)+1))
            carright4hit = 1'b1 ;
        else 
				carright4hit = 1'b0;
				
		if (BallY == carright5y &&(BallX <= carright5x + 10'd14) && (BallX >= carright5x + ~(10'd17)+1))
            carright5hit = 1'b1 ;
        else 
				carright5hit = 1'b0;
				
		if (BallY == carright6y &&(BallX <= carright6x + 10'd14) && (BallX >= carright6x + ~(10'd17)+1))
            carright6hit = 1'b1 ;
        else 
				carright6hit = 1'b0;
				
		if (BallY == carright7y &&(BallX <= carright7x + 10'd14) && (BallX >= carright7x + ~(10'd17)+1))
            carright7hit = 1'b1 ;
        else 
				carright7hit = 1'b0;
				
		if (BallY == carright8y &&(BallX <= carright8x + 10'd14) && (BallX >= carright8x + ~(10'd17)+1))
            carright8hit = 1'b1 ;
        else 
				carright8hit = 1'b0;

		//4 OTHER CAR RIGHTS
		
		if (BallY == othercarright1y &&(BallX <= othercarright1x + 10'd17) && (BallX >= othercarright1x + ~(10'd18)+1))
            othercarright1hit = 1'b1 ;
        else 
				othercarright1hit = 1'b0;
				
		if (BallY == othercarright2y &&(BallX <= othercarright2x + 10'd17) && (BallX >= othercarright2x + ~(10'd18)+1))
            othercarright2hit = 1'b1 ;
        else 
				othercarright2hit = 1'b0;
				
		if (BallY == othercarright3y &&(BallX <= othercarright3x + 10'd17) && (BallX >= othercarright3x + ~(10'd18)+1))
            othercarright3hit = 1'b1 ;
        else 
				othercarright3hit = 1'b0;
				
		if (BallY == othercarright4y &&(BallX <= othercarright4x + 10'd17) && (BallX >= othercarright4x + ~(10'd18)+1))
            othercarright4hit = 1'b1 ;
        else 
				othercarright4hit = 1'b0;
		
		
		
		
		//24 SHORT LOGS
		
		if (BallY == slog1y &&(BallX <= slog1x + 10'd37) && (BallX >= slog1x + ~(10'd10)+1))
            slog1hit = 1'b1 ;
        else 
				slog1hit = 1'b0;
		
		if (BallY == slog2y &&(BallX <= slog2x + 10'd37) && (BallX >= slog2x + ~(10'd10)+1))
            slog2hit = 1'b1 ;
        else 
				slog2hit = 1'b0;
				
		if (BallY == slog3y &&(BallX <= slog3x + 10'd37) && (BallX >= slog3x + ~(10'd10)+1))
            slog3hit = 1'b1 ;
        else 
				slog3hit = 1'b0;
				
		if (BallY == slog4y &&(BallX <= slog4x + 10'd37) && (BallX >= slog4x + ~(10'd10)+1))
            slog4hit = 1'b1 ;
        else 
				slog4hit = 1'b0;
				
		if (BallY == slog5y &&(BallX <= slog5x + 10'd37) && (BallX >= slog5x + ~(10'd10)+1))
            slog5hit = 1'b1 ;
        else 
				slog5hit = 1'b0;
				
		if (BallY == slog6y &&(BallX <= slog6x + 10'd37) && (BallX >= slog6x + ~(10'd10)+1))
            slog6hit = 1'b1 ;
        else 
				slog6hit = 1'b0;
				
		if (BallY == slog7y &&(BallX <= slog7x + 10'd37) && (BallX >= slog7x + ~(10'd10)+1))
            slog7hit = 1'b1 ;
        else 
				slog7hit = 1'b0;
		
		if (BallY == slog8y &&(BallX <= slog8x + 10'd37) && (BallX >= slog8x + ~(10'd10)+1))
            slog8hit = 1'b1 ;
        else 
				slog8hit = 1'b0;
				
		if (BallY == slog9y &&(BallX <= slog9x + 10'd37) && (BallX >= slog9x + ~(10'd10)+1))
            slog9hit = 1'b1 ;
        else 
				slog9hit = 1'b0;
				
		if (BallY == slog10y &&(BallX <= slog10x + 10'd37) && (BallX >= slog10x + ~(10'd10)+1))
            slog10hit = 1'b1 ;
        else 
				slog10hit = 1'b0;
				
		if (BallY == slog11y &&(BallX <= slog11x + 10'd37) && (BallX >= slog11x + ~(10'd10)+1))
            slog11hit = 1'b1 ;
        else 
				slog11hit = 1'b0;
				
		if (BallY == slog12y &&(BallX <= slog12x + 10'd37) && (BallX >= slog12x + ~(10'd10)+1))
            slog12hit = 1'b1 ;
        else 
				slog12hit = 1'b0;
				
		if (BallY == slog13y &&(BallX <= slog13x + 10'd37) && (BallX >= slog13x + ~(10'd10)+1))
            slog13hit = 1'b1 ;
        else 
				slog13hit = 1'b0;
		
		if (BallY == slog14y &&(BallX <= slog14x + 10'd37) && (BallX >= slog14x + ~(10'd10)+1))
            slog14hit = 1'b1 ;
        else 
				slog14hit = 1'b0;
				
		if (BallY == slog15y &&(BallX <= slog15x + 10'd37) && (BallX >= slog15x + ~(10'd10)+1))
            slog15hit = 1'b1 ;
        else 
				slog15hit = 1'b0;
				
		if (BallY == slog16y &&(BallX <= slog16x + 10'd37) && (BallX >= slog16x + ~(10'd10)+1))
            slog16hit = 1'b1 ;
        else 
				slog16hit = 1'b0;
				
		if (BallY == slog17y &&(BallX <= slog17x + 10'd37) && (BallX >= slog17x + ~(10'd10)+1))
            slog17hit = 1'b1 ;
        else 
				slog17hit = 1'b0;
				
		if (BallY == slog18y &&(BallX <= slog18x + 10'd37) && (BallX >= slog18x + ~(10'd10)+1))
            slog18hit = 1'b1 ;
        else 
				slog18hit = 1'b0;
				
		if (BallY == slog19y &&(BallX <= slog19x + 10'd37) && (BallX >= slog19x + ~(10'd10)+1))
            slog19hit = 1'b1 ;
        else 
				slog19hit = 1'b0;
		
		if (BallY == slog20y &&(BallX <= slog20x + 10'd37) && (BallX >= slog20x + ~(10'd10)+1))
            slog20hit = 1'b1 ;
        else 
				slog20hit = 1'b0;
				
		if (BallY == slog21y &&(BallX <= slog21x + 10'd37) && (BallX >= slog21x + ~(10'd10)+1))
            slog21hit = 1'b1 ;
        else 
				slog21hit = 1'b0;
				
		if (BallY == slog22y &&(BallX <= slog22x + 10'd37) && (BallX >= slog22x + ~(10'd10)+1))
            slog22hit = 1'b1 ;
        else 
				slog22hit = 1'b0;
				
		if (BallY == slog23y &&(BallX <= slog23x + 10'd37) && (BallX >= slog23x + ~(10'd10)+1))
            slog23hit = 1'b1 ;
        else 
				slog23hit = 1'b0;
				
		if (BallY == slog24y &&(BallX <= slog24x + 10'd37) && (BallX >= slog24x + ~(10'd10)+1))
            slog24hit = 1'b1 ;
        else 
				slog24hit = 1'b0;
				
				
				//9 BIG LOGS
		if (BallY == blog1y &&(BallX <= blog1x + 10'd84) && (BallX >= blog1x + ~(10'd10)+1))
            blog1hit = 1'b1 ;
        else 
				blog1hit = 1'b0;
		if (BallY == blog2y &&(BallX <= blog2x + 10'd84) && (BallX >= blog2x + ~(10'd10)+1))
            blog2hit = 1'b1 ;
        else 
				blog2hit = 1'b0;
				
		if (BallY == blog3y &&(BallX <= blog3x + 10'd84) && (BallX >= blog3x + ~(10'd10)+1))
            blog3hit = 1'b1 ;
        else 
				blog3hit = 1'b0;
				
		if (BallY == blog4y &&(BallX <= blog4x + 10'd84) && (BallX >= blog4x + ~(10'd10)+1))
            blog4hit = 1'b1 ;
        else 
				blog4hit = 1'b0;
				
		if (BallY == blog5y &&(BallX <= blog5x + 10'd84) && (BallX >= blog5x + ~(10'd10)+1))
            blog5hit = 1'b1 ;
        else 
				blog5hit = 1'b0;
				
		if (BallY == blog6y &&(BallX <= blog6x + 10'd84) && (BallX >= blog6x + ~(10'd10)+1))
            blog6hit = 1'b1 ;
        else 
				blog6hit = 1'b0;
				
		if (BallY == blog7y &&(BallX <= blog7x + 10'd84) && (BallX >= blog7x + ~(10'd10)+1))
            blog7hit = 1'b1 ;
        else 
				blog7hit = 1'b0;
				
		if (BallY == blog8y &&(BallX <= blog8x + 10'd84) && (BallX >= blog8x + ~(10'd10)+1))
            blog8hit = 1'b1 ;
        else 
				blog8hit = 1'b0;
				
		if (BallY == blog9y &&(BallX <= blog9x + 10'd84) && (BallX >= blog9x + ~(10'd10)+1))
            blog9hit = 1'b1 ;
        else 
				blog9hit = 1'b0;	
				
				
		 
     end 
	  
	   //map_ROM_16 mapROM(.currX(DrawX), .currY(DrawY), .outR(mapR), .outG(mapG), .outB(mapB));
       
    always_ff @ (posedge Reset or posedge Clk )
			begin:RGB_Display
        if (Reset)  // Asynchronous Reset
        begin 
            pad1 <= 0;
				pad2 <= 0;
				pad3 <= 0;
				pad4 <= 0;
				pad5 <= 0;
				deathcount <= 5;
			end
			else if (deathcount == 0)
			begin
				 pad1 <= 0;
				pad2 <= 0;
				pad3 <= 0;
				pad4 <= 0;
				pad5 <= 0;
				deathcount <= 5;
			end
    
	 
       else if (truck1hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;

			end
			
        else if (truck2hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end
			
			else if (truck3hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end
			
			else if (truck4hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end    
		
			else if (truck5hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end   
		
			else if (truck6hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end   
		
			else if (truck7hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end   
		
			else if (truck8hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end   
		
			else if (carleft1hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end   

		else if (carleft2hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carleft3hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carleft4hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carleft5hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carleft6hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 

			else if (carright1hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright2hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright3hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright4hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright5hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright6hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright7hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (carright8hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (othercarright1hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (othercarright2hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (othercarright3hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
			
			else if (othercarright4hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 1;
			rightlog <= 0;
			leftlog <= 0;
			win <= 0;
			deathcount <= deathcount - 1;
			end 
	
	
			else if (slog1hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog2hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog3hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog4hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog5hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog6hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
	
			else if (slog7hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog8hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog9hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog10hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog11hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog12hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end
			
			else if (slog13hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog14hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog15hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog16hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog17hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog18hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end
			
			else if (slog19hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog20hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog21hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog22hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog23hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end 
			
			else if (slog24hit == 1'b1)           // DRAW TRUCK 4 NO PADDING
			begin
			dead <= 0;
			rightlog <= 0;
			leftlog <= -1;
			win <= 0;
			end
	
	
			
			else if (blog1hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
		

			end
			
			else if (blog2hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
			

			end
			
			else if (blog3hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
				

			end
			
			else if (blog4hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
				

			end
			
			else if (blog5hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
		

			end
			
			else if (blog6hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
		

			end
			
			else if (blog7hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
				

			end
			
			else if (blog8hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
			
			end
			
			else if (blog9hit == 1'b1)           // DRAW TRUCK 1 NO PADDING
			begin
			dead <= 0;
			rightlog <= 1;
			leftlog <= 0;
			win <= 0;
				

			end
			
			
			
			else                             //IF WE HIT NO MOVING SPRITE
			begin
			
			if (BallY >= 192)         // bottomhalf of screen, should be alive default
				begin
					dead <= 0;
					leftlog <= 0;
					rightlog <= 0;
					win <= 0;
					
				end
			
			else if (BallY < 48 )
				begin
					if((63 <= BallX && BallX<= 90))
					begin
						dead <= 0;
						leftlog <= 0;
						rightlog <= 0;
						win <= 1;
						pad1 <=1'b1;
					end
					else if(178 <= BallX && BallX <= 205)
					begin
						dead <= 0;
						leftlog <= 0;
						rightlog <= 0;
						win <= 1;
						pad2 <= 1'b1;
					end
					else if(295 <= BallX && BallX<= 323)
					begin
						dead <= 0;
						leftlog <= 0;
						rightlog <= 0;
						win <= 1;
						pad3 <= 1'b1;
					end
					else if (411 <= BallX && BallX<= 439)
					begin
						dead <= 0;
						leftlog <= 0;
						rightlog <= 0;
						win <= 1;
						pad4 <= 1'b1;
					end
					else if(527 <= BallX && BallX<= 555)
					begin
						dead <= 0;
						leftlog <= 0;
						rightlog <= 0;
						win <= 1;
						pad5 <= 1'b1;
					end
					
					
				end
			else                        // default dead if in water
			begin
				dead <= 1;
				leftlog <= 0;
				rightlog <= 0;
				win <= 0;
				deathcount <= deathcount - 1;
				
				
			end
		end
    end 
    
endmodule
