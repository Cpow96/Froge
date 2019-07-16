

module  trucks ( input Reset, frame_clk,
               output int  truck1x, truck1y, 
									truck2x, truck2y,
									truck3x, truck3y,
									truck4x, truck4y,
									truck5x, truck5y,
									truck6x, truck6y,
									truck7x, truck7y,
									truck8x, truck8y,
					output truck1dir,
							 truck2dir,
							 truck3dir,
							 truck4dir,
							 truck5dir,
							 truck6dir,
							 truck7dir,
							 truck8dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] truck1startx=0;//320;  // Center position on the X axis
    parameter [9:0] truck1starty=336;//240;  // Center position on the Y axis
	 parameter [9:0] truck2startx=120;//320;  // Center position on the X axis
    parameter [9:0] truck2starty=336;//240;  // Center position on the Y axis
	 parameter [9:0] truck3startx=240;//320;  // Center position on the X axis
    parameter [9:0] truck3starty=336;//240;  // Center position on the Y axis
	 parameter [9:0] truck4startx=360;//320;  // Center position on the X axis
    parameter [9:0] truck4starty=336;//240;  // Center position on the Y axis
	 
	 parameter [9:0] truck5startx=20;//320;  // Center position on the X axis
    parameter [9:0] truck5starty=384;//240;  // Center position on the Y axis
	 parameter [9:0] truck6startx=140;//320;  // Center position on the X axis
    parameter [9:0] truck6starty=384;//240;  // Center position on the Y axis
	 parameter [9:0] truck7startx=260;//320;  // Center position on the X axis
    parameter [9:0] truck7starty=384;//240;  // Center position on the Y axis
	 parameter [9:0] truck8startx=380;//320;  // Center position on the X axis
    parameter [9:0] truck8starty=384;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=-48;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] truckxstep=1;      // MODIFIER FOR STEP 


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				truck1y <= truck1starty;
				truck1x <= truck1startx;
				truck2y <= truck2starty;
				truck2x <= truck2startx;
				truck3y <= truck3starty;
				truck3x <= truck3startx;
				truck4y <= truck4starty;
				truck4x <= truck4startx;
				truck5y <= truck5starty;
				truck5x <= truck5startx;
				truck6y <= truck6starty;
				truck6x <= truck6startx;
				truck7y <= truck7starty;
				truck7x <= truck7startx;
				truck8y <= truck8starty;
				truck8x <= truck8startx;
				//counter <= 8'hff;
				truck1dir <= 8'd0;
				truck2dir <= 8'd0;
				truck3dir <= 8'd0;
				truck4dir <= 8'd0;
				truck5dir <= 8'd1;
				truck6dir <= 8'd1;
				truck7dir <= 8'd1;
				truck8dir <= 8'd1;
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
					  
				 else if ( ((Ball_X_Pos - Ball_Size) <= Ball_X_Min) ||  ((Ball_X_Pos - Ball_Size) >= Ball_X_Max))  // Ball is at the left edge, BOUNCE!
				 begin
					  Ball_Y_Motion <= 10'd0;
					  Ball_X_Motion <= Ball_X_Step;
				 end
					  
//				 else 
//					  Ball_X_Motion <= Ball_X_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  */
				 //Ball_X_Motion <= Ball_X_Motion;  // You need to remove this and make both X and Y respond to keyboard input
				 
				 
				 //------TRUCK1 LEFT
				 
				 if (truck1x < -48 )                      // if it's less than -48 sorta 
				 begin
					truck1x <= 646;              // Truck 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck1x <= (truck1x + ~(truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck1y <= 320;
				 
				 
				 //------TRUCK 2 LEFT
				 
				 if (truck2x < -48 )                      // if it's less than -48 sorta 
				 begin
					truck2x <= 646;              // Truck 2 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck2x <= (truck2x + ~(truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck2y <= 320;
				 
				 
				 //------TRUCK 3 LEFT
				 
				 if (truck3x < -48 )                      // if it's less than -48 sorta 
				 begin
					truck3x <= 646;              // Truck 3 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck3x <= (truck3x + ~(truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck3y <= 320;
				 
				 if (truck4x < -48 )                      // if it's less than -48 sorta 
				 begin
					truck4x <= 646;              // Truck 4 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck4x <= (truck4x + ~(truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck1y <= 320;
				 
				 
				 //------TRUCK 5 LEFT
				 
				 if (truck5x -48>640 )                      // if it's less than -48 sorta 
				 begin
					truck5x <= -16;              // Truck 5 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck5x <= (truck5x + (truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck5y <= 320;
				 
				 if (truck6x -48>640 )                      // if it's less than -48 sorta 
				 begin
					truck6x <= -16;              // Truck 6 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck6x <= (truck6x + (truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck1y <= 320;
				 
				 
				 //------TRUCK 7 LEFT
				 
				 if (truck7x -48>640 )                      // if it's less than -48 sorta 
				 begin
					truck7x <= -16;              // Truck 7 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					truck7x <= (truck7x + (truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck7y <= 320;
				 
				 				 
				 if (truck8x -48 > 640 )                      // if it's less than -48 sorta 
				 begin
					truck8x <= -16;              // Truck 2 loops back around to negative 200 pixels
				 end 
				 else
				 begin
					truck8x <= (truck8x + (truckxstep)+1);  // Update truck position, truck 1 moves left
					end
				 //truck1y <= 320;

      
			
		end  
    end
       
    

endmodule
