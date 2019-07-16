//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk, dead, win, wall,
					input int rightlog, leftlog,
					input [7:0] KEYCODE,
					output [9:0]  BallX, BallY, BallS,
					output [2:0] direction,
					output unpaused, manualreset,
					output [7:0] counter);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] Ball_X_Center=320;//320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=432;//240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
				counter <= 8'hff;
				direction <= 8'd0;
				unpaused <= 1'b0;
				manualreset <= 0;
        end
           
			 else if (dead || win > 0 || manualreset)
			 begin
			 Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
				counter <= 8'hff;
				direction <= 8'd0;
				manualreset <= 0;
			 end
			
        else 
        begin 
				lastkey	<= KEYCODE;
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
				 
				 if (counter > 0 && counter <= 30)
				 begin
					counter <= counter - 1;
				end
				 if (counter == 0)
				begin
					direction <= direction - 4;
					counter <= ~(8'd1)+1;
				end
				
				 if (lastkey == 8'd0 && KEYCODE == 8'h29)	// when esc pressed
				 begin
					unpaused <= ~unpaused;
				 end
				 
				 else if (lastkey == 8'd0 && KEYCODE == 8'h15)	// when esc pressed
				 begin
					manualreset <= 1'b1;
				 end
				 
				 else if (lastkey == 8'd0 && KEYCODE == 8'b00000111 && unpaused == 1'b1)	// when right key is pressed: 7
				 begin
					Ball_X_Motion <= 10'd24+ rightlog + leftlog;
					counter <= 8'd15;                      //30 frames of jump
					direction <= 5;
					 if ( (Ball_X_Pos + 24) >= Ball_X_Max )  // Ball is at the right edge, BOUNCE!
						Ball_X_Motion <= 0 ;  // 2's complement.
					Ball_Y_Motion <= 10'd0;
				 end
				 
				 
				 else if (lastkey == 8'd0 &&KEYCODE == 8'b00000100&& unpaused == 1'b1)	// when left key is pressed: 4
				 begin
					Ball_X_Motion <= ~(10'd24)+1+ rightlog + leftlog;
					counter <= 8'd15;                      //30 frames of jump
					direction <= 7;
					 if (((Ball_X_Pos - 24) < Ball_X_Min) ||  ((Ball_X_Pos - 24) >= Ball_X_Max))  // Ball is at the left edge, BOUNCE!
						Ball_X_Motion <= 0;
					Ball_Y_Motion <= 10'd0;
				 end
				 
				 
				 else if (lastkey == 8'd0 &&KEYCODE == 8'b00010110&& unpaused == 1'b1)	// when down key is pressed: 22
				 begin
					Ball_Y_Motion <= 10'd24;
					counter <= 8'd15;                      //30 frames of jump
					direction <= 6;
					if ( (Ball_Y_Pos + 24) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					  Ball_Y_Motion <= 0;  // 2's complement.
					Ball_X_Motion <= 10'd0;
				 end
				 
				 
				 else if (lastkey == 8'd0 && KEYCODE == 8'b00011010&& unpaused == 1'b1)	// when up key is pressed: 26
				 begin
					
					Ball_Y_Motion <= ~(10'd24)+1;
					counter <= 8'd15;                      //30 frames of jump
					direction <= 4;                     // set him to be jumpin'
					if ( ((Ball_Y_Pos - 24) < Ball_Y_Min)  || ((Ball_Y_Pos - 24) >= Ball_Y_Max))
						begin
							Ball_Y_Motion <= 0;
					   end
					else if (((BallY == 48) && ( (0 <= BallX && BallX <= 62) || (91 <= BallX && BallX <= 177) || (206 <= BallX && BallX <= 294) || (324 <= BallX && BallX <= 410) || (440 <= BallX && BallX <= 526) )))  // Ball is at the top edge, BOUNCE!)
						begin
							Ball_Y_Motion <= 0;
						end
					Ball_X_Motion <= 10'd0;
					
					
					end
				 

					else if (unpaused == 1'b0)    //game paused don't move
					begin
						Ball_X_Motion <= 0;
						Ball_Y_Motion <= 0;
					end
					
					else
						begin
						Ball_X_Motion <= 0+ rightlog + leftlog;
						Ball_Y_Motion <= 0;
					end
				Ball_Y_Pos = (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos = (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
