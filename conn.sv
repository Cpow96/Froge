

module  conn ( input Reset, frame_clk, pad1, pad2, pad3, pad4, pad5,
					input int win, 
               output int  conn1x, conn1y,
					conn2x, conn2y,
					conn3x, conn3y,
					conn4x, conn4y,
					conn5x, conn5y);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] conn1xstart = 76;
    parameter [9:0] conn1ystart = 20;
	 parameter [9:0] conn2xstart = 191;
    parameter [9:0] conn2ystart = 20;
	 parameter [9:0] conn3xstart = 309;
    parameter [9:0] conn3ystart = 20;
	 parameter [9:0] conn4xstart = 425;
    parameter [9:0] conn4ystart = 20;
	 parameter [9:0] conn5xstart = 541;
    parameter [9:0] conn5ystart = 20;
	
	 
    parameter [9:0] Ball_X_Min=0;       // rightmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				if (win == 1 || pad1 == 1'b1)
				begin
					conn1x <= conn1xstart;
					conn1y <= conn1ystart;
				end
				
				else if (win == 2  || pad2 == 1'b1)
				begin
					conn2x <= conn2xstart;
					conn2y <= conn2ystart;
				end
				
				else if (win == 3 || pad3 == 1'b1)
				begin
					conn3x <= conn3xstart;
					conn3y <= conn3ystart;
				end
				
				else if (win == 4 || pad4 == 1'b1)
				begin
					conn4x <= conn4xstart;
					conn4y <= conn4ystart;
				end
				
				else if (win == 5 || pad5 == 1'b1)
				begin
					conn5x <= conn5xstart;
					conn5y <= conn5ystart;
				end

        end
           
        else 
        begin 
		  if (win == 1 || pad1 == 1'b1)
				begin
					conn1x <= conn1xstart;
					conn1y <= conn1ystart;
				end
				
				else if (win == 2  || pad2 == 1'b1)
				begin
					conn2x <= conn2xstart;
					conn2y <= conn2ystart;
				end
				
				else if (win == 3 || pad3 == 1'b1)
				begin
					conn3x <= conn3xstart;
					conn3y <= conn3ystart;
				end
				
				else if (win == 4 || pad4 == 1'b1)
				begin
					conn4x <= conn4xstart;
					conn4y <= conn4ystart;
				end
				
				else if (win == 5 || pad5 == 1'b1)
				begin
					conn5x <= conn5xstart;
					conn5y <= conn5ystart;
				end

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
				 
				
      
			
		end  
    end
       
    

endmodule
