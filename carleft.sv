

module  carleft ( input Reset, frame_clk,
               output int  carleft1x, carleft1y,
					carleft2x, carleft2y,
					carleft3x, carleft3y,
					carleft4x, carleft4y,
					carleft5x, carleft5y,
					carleft6x, carleft6y,
					output carleft1dir,
					carleft2dir,
					carleft3dir,
					carleft4dir,
					carleft5dir,
					carleft6dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] carleft1startx=412;//320;  // Center position on the X axis
    parameter [9:0] carleft1starty=408;//240;  // Center position on the Y axis
	 parameter [9:0] carleft2startx=64;//320;  // Center position on the X axis
    parameter [9:0] carleft2starty=408;//240;  // Center position on the Y axis
	 parameter [9:0] carleft3startx=244;//320;  // Center position on the X axis
    parameter [9:0] carleft3starty=408;//240;  // Center position on the Y axis
	 
	 parameter [9:0] carleft4startx=100;//320;  // Center position on the X axis
    parameter [9:0] carleft4starty=264;//240;  // Center position on the Y axis
	 parameter [9:0] carleft5startx=440;//320;  // Center position on the X axis
    parameter [9:0] carleft5starty=264;//240;  // Center position on the Y axis
	 parameter [9:0] carleft6startx=192;//320;  // Center position on the X axis
    parameter [9:0] carleft6starty=264;//240;  // Center position on the Y axis
	 //parameter [9:0] truck2startx=400;//320;  // Center position on the X axis
    //parameter [9:0] truck2starty=332;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] carleftxstep=1;      // MODIFIER FOR STEP 



   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				carleft1x <= carleft1startx;
				carleft1y <= carleft1starty;
				carleft1dir <= 8'd0;
				
				carleft2x <= carleft2startx;
				carleft2y <= carleft2starty;
				carleft2dir <= 8'd0;
				

				carleft3x <= carleft3startx;
				carleft3y <= carleft3starty;
				carleft3dir <= 8'd0;
				

				carleft4x <= carleft4startx;
				carleft4y <= carleft4starty;
				carleft4dir <= 8'd0;
				

				carleft5x <= carleft5startx;
				carleft5y <= carleft5starty;
				carleft5dir <= 8'd0;
				

				carleft6x <= carleft6startx;
				carleft6y <= carleft6starty;
				carleft6dir <= 8'd0;

        end
           
        else 
        begin 
	 
				 
				 //------1
				 
				 if (carleft1x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft1x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft1x <= (carleft1x + ~(carleftxstep)+1);  // Update carleft position, carleft 1 moves left
					end
				//------2
				 
				 if (carleft2x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft2x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft2x <= (carleft2x + ~(carleftxstep)+1);  // Update carleft position, carleft 1 moves left
					end
				//------3
				 
				 if (carleft3x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft3x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft3x <= (carleft3x + ~(carleftxstep)+1);  // Update carleft position, carleft 1 moves left
					end
				//------4
				 
				 if (carleft4x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft4x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft4x <= (carleft4x + ~(carleftxstep));  // Update carleft position, carleft 1 moves left
					end
				//------5
				 
				 if (carleft5x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft5x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft5x <= (carleft5x + ~(carleftxstep));  // Update carleft position, carleft 1 moves left
					end
				//------6
				 
				 if (carleft6x < - 23)                      // if it's less than -48 sorta 
				 begin
					carleft6x <= 646;              // carleft 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					carleft6x <= (carleft6x + ~(carleftxstep));  // Update carleft position, carleft 1 moves left
					end


      
			
		end  
    end
       
    

endmodule
