

module  carright ( input Reset, frame_clk,
               output int  carright1x, carright1y,
									carright2x, carright2y,
									carright3x, carright3y,
									carright4x, carright4y,
									carright5x, carright5y,
									carright6x, carright6y,
									carright7x, carright7y,
									carright8x, carright8y,
					output carright1dir,
							 carright2dir,
							 carright3dir,
							 carright4dir,
							 carright5dir,
							 carright6dir,
							 carright7dir,
							 carright8dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] carright1startx=0;//320;  // Center position on the X axis
    parameter [9:0] carright1starty=288;//240;  // Center position on the Y axis
	 parameter [9:0] carright2startx=240;//320;  // Center position on the X axis
    parameter [9:0] carright2starty=288;//240;  // Center position on the Y axis
	 parameter [9:0] carright3startx=350;//320;  // Center position on the X axis
    parameter [9:0] carright3starty=288;//240;  // Center position on the Y axis
	 parameter [9:0] carright4startx=470;//320;  // Center position on the X axis
    parameter [9:0] carright4starty=288;//240;  // Center position on the Y axis
	 
	 parameter [9:0] carright5startx=30;//320;  // Center position on the X axis
    parameter [9:0] carright5starty=360;//240;  // Center position on the Y axis
	 parameter [9:0] carright6startx=270;//320;  // Center position on the X axis
    parameter [9:0] carright6starty=360;//240;  // Center position on the Y axis
	 parameter [9:0] carright7startx=380;//320;  // Center position on the X axis
    parameter [9:0] carright7starty=360;//240;  // Center position on the Y axis
	 parameter [9:0] carright8startx=478;//320;  // Center position on the X axis
    parameter [9:0] carright8starty=360;//240;  // Center position on the Y axis
	 //parameter [9:0] truck2startx=400;//320;  // Center position on the X axis
    //parameter [9:0] truck2starty=332;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] carrightxstep=1;      // MODIFIER FOR STEP 


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				carright1x <= carright1startx;
				carright1y <= carright1starty;
				carright2x <= carright2startx;
				carright2y <= carright2starty;
				carright3x <= carright3startx;
				carright3y <= carright3starty;
				carright4x <= carright4startx;
				carright4y <= carright4starty;
				carright5x <= carright5startx;
				carright5y <= carright5starty;
				carright6x <= carright6startx;
				carright6y <= carright6starty;
				carright7x <= carright7startx;
				carright7y <= carright7starty;
				carright8x <= carright8startx;
				carright8y <= carright8starty;
				//truck1y <= truck1starty;
				//truck1x <= truck1startx;
				//truck2y <= truck2starty;
				//truck2x <= truck2startx;
				//counter <= 8'hff;
				carright1dir <= 8'd0;
				carright2dir <= 8'd0;
				carright3dir <= 8'd0;
				carright4dir <= 8'd0;
				carright5dir <= 8'd0;
				carright6dir <= 8'd0;
				carright7dir <= 8'd0;
				carright8dir <= 8'd0;
				//truck2dir <= 8'd0;
        end
           
        else 
        begin 
				/*
				 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
				 begin
					  Ball_X_Motion <= 10'd0;
					  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
				 end
					  
				 else if ( ((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min)  || ((Ball_Y_Pos - Ball_Size) >= Ball_Y_Max))  // Ball is at the top edge, BOUNCE!
				 begin
					  Ball_X_Motion <= 10'd0;
					  Ball_Y_Motion <= Ball_Y_Step;
				 end
					  
//				 else 
//					  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the right edge, BOUNCE!
				 begin
					  Ball_Y_Motion <= 10'd0;
					  Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
				 end
					  
				 else if ( ((Ball_X_Pos - Ball_Size) <= Ball_X_Min) ||  ((Ball_X_Pos - Ball_Size) >= Ball_X_Max))  // Ball is at the right edge, BOUNCE!
				 begin
					  Ball_Y_Motion <= 10'd0;
					  Ball_X_Motion <= Ball_X_Step;
				 end
					  
//				 else 
//					  Ball_X_Motion <= Ball_X_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  */
				 //Ball_X_Motion <= Ball_X_Motion;  // You need to remove this and make both X and Y respond to keyboard input
				 
				 
				 //------TRUCK1 right
				 //(~ (Ball_X_Step) + 1'b1)
				 if (carright1x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright1x <= -16;              // carright 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright1x <= (carright1x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright2x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright2x <= -16;              // carright 2 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright2x <= (carright2x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright3x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright3x <= -16;              // carright 3 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright3x <= (carright3x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
					
				if (carright4x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright4x <= -16;              // carright 4 loops back around to negative 400 pixels
				 end 
				 else
				 begin
					carright4x <= (carright4x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright5x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright5x <= -16;              // carright 5 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright5x <= (carright5x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright6x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright6x <= -16;              // carright 6 loops back around to negative 600 pixels
				 end 
				 else
				 begin
					carright6x <= (carright6x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright7x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright7x <= -16;              // carright 7 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright7x <= (carright7x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (carright8x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					carright8x <= -16;              // carright 8 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carright8x <= (carright8x + (carrightxstep));  // Update carleft position, carleft 1 moves left
					end
				 //truck1y <= 320;
				 
				 
				 //------TRUCK 2 LEFT
				 /*
				 if (truck2x < +23 )                      // if it's less than -48 sorta 
				 begin
					truck2x <= 740;              // Truck 2 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck2x <= (truck2x + ~(truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck2y <= 320;
				 */
      
			
		end  
    end
       
    

endmodule
