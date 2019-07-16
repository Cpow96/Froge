

module  blog ( input Reset, frame_clk,
               output int  blog1x, blog1y,
									blog2x, blog2y,
									blog3x, blog3y,
									blog4x, blog4y,
									blog5x, blog5y,
									blog6x, blog6y,
									blog7x, blog7y,
									blog8x, blog8y,
									blog9x, blog9y,
					output blog1dir,
							 blog2dir,
							 blog3dir,
							 blog4dir,
							 blog5dir,
							 blog6dir,
							 blog7dir,
							 blog8dir,
							 blog9dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] blog1startx=0;//320;  // Center position on the X axis
    parameter [9:0] blog1starty=72;//240;  // Center position on the Y axis
	 parameter [9:0] blog2startx=96;//320;  // Center position on the X axis
    parameter [9:0] blog2starty=72;//240;  // Center position on the Y axis
	 parameter [9:0] blog3startx=288;//320;  // Center position on the X axis
    parameter [9:0] blog3starty=72;//240;  // Center position on the Y axis
	 
	 parameter [9:0] blog4startx=96;//320;  // Center position on the X axis
    parameter [9:0] blog4starty=120;//240;  // Center position on the Y axis 
	 parameter [9:0] blog5startx=384;//320;  // Center position on the X axis
    parameter [9:0] blog5starty=120;//240;  // Center position on the Y axis
	 parameter [9:0] blog6startx=480;//320;  // Center position on the X axis
    parameter [9:0] blog6starty=120;//240;  // Center position on the Y axis
	 
	 
	 parameter [9:0] blog7startx=48;//320;  // Center position on the X axis
    parameter [9:0] blog7starty=144;//240;  // Center position on the Y axis
	 parameter [9:0] blog8startx=144;//320;  // Center position on the X axis
    parameter [9:0] blog8starty=144;//240;  // Center position on the Y axis
	 parameter [9:0] blog9startx=432;//320;  // Center position on the X axis
    parameter [9:0] blog9starty=144;//240;  // Center position on the Y axis	 
	 //parameter [9:0] truck2startx=400;//320;  // Center position on the X axis
    //parameter [9:0] truck2starty=332;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] blogxstep=1;      // MODIFIER FOR STEP 


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				blog1x <= blog1startx;
				blog1y <= blog1starty;
				blog2x <= blog2startx;
				blog2y <= blog2starty;
				blog3x <= blog3startx;
				blog3y <= blog3starty;
				blog4x <= blog4startx;
				blog4y <= blog4starty;
				blog5x <= blog5startx;
				blog5y <= blog5starty;
				blog6x <= blog6startx;
				blog6y <= blog6starty;
				blog7x <= blog7startx;
				blog7y <= blog7starty;
				blog8x <= blog8startx;
				blog8y <= blog8starty;
				blog9x <= blog9startx;
				blog9y <= blog9starty;
				//truck1y <= truck1starty;
				//truck1x <= truck1startx;
				//truck2y <= truck2starty;
				//truck2x <= truck2startx;
				//counter <= 8'hff;
				blog1dir <= 8'd0;
				blog2dir <= 8'd0;
				blog3dir <= 8'd0;
				blog4dir <= 8'd0;
				blog5dir <= 8'd0;
				blog6dir <= 8'd0;
				blog7dir <= 8'd0;
				blog8dir <= 8'd0;
				blog9dir <= 8'd0;
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
				 if (blog1x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog1x <= -16;              // blog 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog1x <= (blog1x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog2x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog2x <= -16;              // blog 2 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog2x <= (blog2x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog3x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog3x <= -16;              // blog 3 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog3x <= (blog3x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
					
				if (blog4x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog4x <= -16;              // blog 4 loops back around to negative 400 pixels
				 end 
				 else
				 begin
					blog4x <= (blog4x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog5x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog5x <= -16;              // blog 5 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog5x <= (blog5x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog6x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog6x <= -16;              // blog 6 loops back around to negative 600 pixels
				 end 
				 else
				 begin
					blog6x <= (blog6x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog7x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog7x <= -16;              // blog 7 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog7x <= (blog7x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog8x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog8x <= -16;              // blog 8 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog8x <= (blog8x + (blogxstep));  // Update carleft position, carleft 1 moves left
					end
					
				if (blog9x -23 > 640)                      // if it's less than -48 sorta 
				 begin
					blog9x <= -16;              // blog 8 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					blog9x <= (blog9x + (blogxstep));  // Update carleft position, carleft 1 moves left
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
