

module  othercarright ( input Reset, frame_clk,
               output int  othercarright1x, othercarright1y,
					othercarright2x, othercarright2y,
					othercarright3x, othercarright3y,
					othercarright4x, othercarright4y,
					output othercarright1dir,
					othercarright2dir,
					othercarright3dir,
					othercarright4dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] othercarright1startx=144;//320;  // Center position on the X axis
    parameter [9:0] othercarright1starty=312;//240;  // Center position on the Y axis
	 parameter [9:0] othercarright2startx=0;//320;  // Center position on the X axis
    parameter [9:0] othercarright2starty=312;//240;  // Center position on the Y axis
	 parameter [9:0] othercarright3startx=432;//320;  // Center position on the X axis
    parameter [9:0] othercarright3starty=312;//240;  // Center position on the Y axis
	 parameter [9:0] othercarright4startx=288;//320;  // Center position on the X axis
    parameter [9:0] othercarright4starty=312;//240;  // Center position on the Y axis
	 //parameter [9:0] truck2startx=400;//320;  // Center position on the X axis
    //parameter [9:0] truck2starty=332;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // rightmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] othercarrightxstep=2;      // MODIFIER FOR STEP 


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				othercarright1x <= othercarright1startx;
				othercarright1y <= othercarright1starty;
				othercarright2x <= othercarright2startx;
				othercarright2y <= othercarright2starty;
				othercarright3x <= othercarright3startx;
				othercarright3y <= othercarright3starty;
				othercarright4x <= othercarright4startx;
				othercarright4y <= othercarright4starty;
				//truck1y <= truck1starty;
				//truck1x <= truck1startx;
				//truck2y <= truck2starty;
				//truck2x <= truck2startx;
				//counter <= 8'hff;
				
				othercarright1dir <= 8'd0;
				othercarright2dir <= 8'd0;
				othercarright3dir <= 8'd0;
				othercarright4dir <= 8'd0;
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
				 
				 if (othercarright1x > 640)                      // if it's less than -48 sorta 
				 begin
					othercarright1x <= -32;              // othercarright 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					othercarright1x <= (othercarright1x + (othercarrightxstep) );  // Update othercarleft position, othercarleft 1 moves left
					end
					
				if (othercarright2x > 640)                      // if it's less than -48 sorta 
				 begin
					othercarright2x <= -32;              // othercarright 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					othercarright2x <= (othercarright2x + (othercarrightxstep) );  // Update othercarleft position, othercarleft 1 moves left
					end
					
				if (othercarright3x > 640)                      // if it's less than -48 sorta 
				 begin
					othercarright3x <= -32;              // othercarright 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					othercarright3x <= (othercarright3x + (othercarrightxstep) );  // Update othercarleft position, othercarleft 1 moves left
					end
					
				if (othercarright4x > 640)                      // if it's less than -48 sorta 
				 begin
					othercarright4x <= -32;              // othercarright 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					othercarright4x <= (othercarright4x + (othercarrightxstep) );  // Update othercarleft position, othercarleft 1 moves left
					end
				 //truck1y <= 320;
				 
				 
				 //------TRUCK 2 LEFT
				 /*
				 if (truck2x < -23 )                      // if it's less than -48 sorta 
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
