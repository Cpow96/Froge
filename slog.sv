module  slog ( input Reset, frame_clk,
               output int  slog1x, slog1y,
					slog2x, slog2y,
					slog3x, slog3y,
					slog4x, slog4y,
					slog5x, slog5y,
					slog6x, slog6y,
					slog7x, slog7y,
					slog8x, slog8y,
					slog9x, slog9y,
					slog10x, slog10y,
					slog11x, slog11y,
					slog12x, slog12y,
					slog13x, slog13y,
					slog14x, slog14y,
					slog15x, slog15y,
					slog16x, slog16y,
					slog17x, slog17y,
					slog18x, slog18y,
					slog19x, slog19y,
					slog20x, slog20y,
					slog21x, slog21y,
					slog22x, slog22y,
					slog23x, slog23y,
					slog24x, slog24y,
					output slog1dir,
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
					slog8dir);
    
	 ///ASSIGNING DIRECTION 0 FOR TEST
	 
	 
	 
    int Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
	
	logic[7:0] lastkey;
	//logic [7:0] counter;
    parameter [9:0] slog1startx=0;//320;  // Center position on the X axis
    parameter [9:0] slog1starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog2startx=48;//320;  // Center position on the X axis
    parameter [9:0] slog2starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog3startx=96;//320;  // Center position on the X axis
    parameter [9:0] slog3starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog4startx=192;//320;  // Center position on the X axis
    parameter [9:0] slog4starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog5startx=288;//320;  // Center position on the X axis
    parameter [9:0] slog5starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog6startx=336;//320;  // Center position on the X axis
    parameter [9:0] slog6starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog7startx=384;//320;  // Center position on the X axis
    parameter [9:0] slog7starty=48;//240;  // Center position on the Y axis
	 parameter [9:0] slog8startx=528;//320;  // Center position on the X axis
    parameter [9:0] slog8starty=48;//240;  // Center position on the Y axis
	 
	 parameter [9:0] slog9startx=0;//320;  // Center position on the X axis
    parameter [9:0] slog9starty=96;//240;  // Center position on the Y axis 
	 parameter [9:0] slog10startx=96;//320;  // Center position on the X axis  //broken
    parameter [9:0] slog10starty=96;//240;  // Center position on the Y axis
	 parameter [9:0] slog11startx=144;//320;  // Center position on the X axis
    parameter [9:0] slog11starty=96;//240;  // Center position on the Y axis
	 parameter [9:0] slog12startx=192;//320;  // Center position on the X axis  
    parameter [9:0] slog12starty=96;//240;  // Center position on the Y axis
	 parameter [9:0] slog13startx=240;//320;  // Center position on the X axis  
    parameter [9:0] slog13starty=96;//240;  // Center position on the Y axis
	 parameter [9:0] slog14startx=336;//320;  // Center position on the X axis
    parameter [9:0] slog14starty=96;//240;  // Center position on the Y axis
	 parameter [9:0] slog15startx=384;//320;  // Center position on the X axis
    parameter [9:0] slog15starty=96;//240;  // Center position on the Y axis
	 
	 parameter [9:0] slog16startx=528;//320;  // Center position on the X axis
    parameter [9:0] slog16starty=96;//240;  // Center position on the Y axis
	 
	 parameter [9:0] slog17startx=144;//320;  // Center position on the X axis
    parameter [9:0] slog17starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog18startx=192;//320;  // Center position on the X axis
    parameter [9:0] slog18starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog19startx=288;//320;  // Center position on the X axis
    parameter [9:0] slog19starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog20startx=336;//320;  // Center position on the X axis
    parameter [9:0] slog20starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog21startx=432;//320;  // Center position on the X axis
    parameter [9:0] slog21starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog22startx=480;//320;  // Center position on the X axis
    parameter [9:0] slog22starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog23startx=528;//320;  // Center position on the X axis
    parameter [9:0] slog23starty=168;//240;  // Center position on the Y axis
	 parameter [9:0] slog24startx=576;//320;  // Center position on the X axis
    parameter [9:0] slog24starty=168;//240;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // rightmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis is 32 bits from the edge
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis is 32 bits up
    parameter [9:0] slogxstep=1;      // MODIFIER FOR STEP 


   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
				slog1x <= slog1startx;
				slog1y <= slog1starty;
				slog1dir <= 8'd0;
				slog2x <= slog2startx;
				slog2y <= slog2starty;
				slog2dir <= 8'd0;
				slog3x <= slog3startx;
				slog3y <= slog3starty;
				slog3dir <= 8'd0;
				slog4x <= slog4startx;
				slog4y <= slog4starty;
				slog4dir <= 8'd0;
				slog5x <= slog5startx;
				slog5y <= slog5starty;
				slog5dir <= 8'd0;
				slog6x <= slog6startx;
				slog6y <= slog6starty;
				slog6dir <= 8'd0;
				slog7x <= slog7startx;
				slog7y <= slog7starty;
				slog7dir <= 8'd0;
				slog8x <= slog8startx;
				slog8y <= slog8starty;
				slog8dir <= 8'd0;
				slog9x <= slog9startx;
				slog9y <= slog9starty;
				slog9dir <= 8'd0;
				slog10x <= slog10startx;
				slog10y <= slog10starty;
				slog10dir <= 8'd0;
				slog11x <= slog11startx;
				slog11y <= slog11starty;
				slog11dir <= 8'd0;
				slog12x <= slog12startx;
				slog12y <= slog12starty;
				slog12dir <= 8'd0;
				slog13x <= slog13startx;
				slog13y <= slog13starty;
				slog13dir <= 8'd0;
				slog14x <= slog14startx;
				slog14y <= slog14starty;
				slog14dir <= 8'd0;
				slog15x <= slog15startx;
				slog15y <= slog15starty;
				slog15dir <= 8'd0;
				slog16x <= slog16startx;
				slog16y <= slog16starty;
				slog16dir <= 8'd0;
				slog17x <= slog17startx;
				slog17y <= slog17starty;
				slog17dir <= 8'd0;
				slog18x <= slog18startx;
				slog18y <= slog18starty;
				slog18dir <= 8'd0;
				slog19x <= slog19startx;
				slog19y <= slog19starty;
				slog19dir <= 8'd0;
				slog20x <= slog20startx;
				slog20y <= slog20starty;
				slog20dir <= 8'd0;
				slog21x <= slog21startx;
				slog21y <= slog21starty;
				slog21dir <= 8'd0;
				slog22x <= slog22startx;
				slog22y <= slog22starty;
				slog22dir <= 8'd0;
				slog23x <= slog23startx;
				slog23y <= slog23starty;
				slog23dir <= 8'd0;
				slog24x <= slog24startx;
				slog24y <= slog24starty;
				slog24dir <= 8'd0;
        end
           
        else 
        begin 			 
				 //------small log 1
				 
				 if (slog1x < -47)                      // if it's less than -48 sorta 
				 begin
					slog1x <= 646;              // slog 1 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog1x <= (slog1x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 2
				 
				 if (slog2x < -47)                      // if it's less than -48 sorta 
				 begin
					slog2x <= 646;              // slog 2 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog2x <= (slog2x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 3
				 
				 if (slog3x < -47)                      // if it's less than -48 sorta 
				 begin
					slog3x <= 646;              // slog 3 loops back around to negative 300 pixels
				 end 
				 else
				 begin
					slog3x <= (slog3x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 4
				 
				 if (slog4x < -47)                      // if it's less than -48 sorta 
				 begin
					slog4x <= 646;              // slog 4 loops back around to negative 400 pixels
				 end 
				 else
				 begin
					slog4x <= (slog4x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 5
				 
				 if (slog5x < -47)                      // if it's less than -48 sorta 
				 begin
					slog5x <= 646;              // slog 5 loops back around to negative 500 pixels
				 end 
				 else
				 begin
					slog5x <= (slog5x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 6
				 
				 if (slog6x < -47)                      // if it's less than -48 sorta 
				 begin
					slog6x <= 646;              // slog 6 loops back around to negative 600 pixels
				 end 
				 else
				 begin
					slog6x <= (slog6x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 7
				 
				 if (slog7x < -47)                      // if it's less than -48 sorta 
				 begin
					slog7x <= 646;              // slog 7 loops back around to negative 700 pixels
				 end 
				 else
				 begin
					slog7x <= (slog7x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 8
				 
				 if (slog8x < -47)                      // if it's less than -48 sorta 
				 begin
					slog8x <= 646;              // slog 8 loops back around to negative 800 pixels
				 end 
				 else
				 begin
					slog8x <= (slog8x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 9
				 
				 if (slog9x < -47)                      // if it's less than -48 sorta 
				 begin
					slog9x <= 646;              // slog 9 loops back around to negative 900 pixels
				 end 
				 else
				 begin
					slog9x <= (slog9x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 10
				 
				 if (slog10x < -47)                      // if it's less than -48 sorta 
				 begin
					slog10x <= 646;              // slog 10 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog10x <= (slog10x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 11
				 
				 if (slog11x < -47)                      // if it's less than -48 sorta 
				 begin
					slog11x <= 646;              // slog 11 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog11x <= (slog11x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 12
				 
				 if (slog12x < -47)                      // if it's less than -48 sorta 
				 begin
					slog12x <= 646;              // slog 12 loops back around to negative 1200 pixels
				 end 
				 else
				 begin
					slog12x <= (slog12x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 13
				 
				 if (slog13x < -47)                      // if it's less than -48 sorta 
				 begin
					slog13x <= 646;              // slog 13 loops back around to negative 1300 pixels
				 end 
				 else
				 begin
					slog13x <= (slog13x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 14
				 
				 if (slog14x < -47)                      // if it's less than -48 sorta 
				 begin
					slog14x <= 646;              // slog 14 loops back around to negative 1400 pixels
				 end 
				 else
				 begin
					slog14x <= (slog14x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 15
				 
				 if (slog15x < -47)                      // if it's less than -48 sorta 
				 begin
					slog15x <= 646;              // slog 15 loops back around to negative 1500 pixels
				 end 
				 else
				 begin
					slog15x <= (slog15x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 16
				 
				 if (slog16x < -47)                      // if it's less than -48 sorta 
				 begin
					slog16x <= 646;              // slog 16 loops back around to negative 1600 pixels
				 end 
				 else
				 begin
					slog16x <= (slog16x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 17
				 
				 if (slog17x < -47)                      // if it's less than -48 sorta 
				 begin
					slog17x <= 646;              // slog 17 loops back around to negative 1700 pixels
				 end 
				 else
				 begin
					slog17x <= (slog17x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 18
				 
				 if (slog18x < -47)                      // if it's less than -48 sorta 
				 begin
					slog18x <= 646;              // slog 18 loops back around to negative 1800 pixels
				 end 
				 else
				 begin
					slog18x <= (slog18x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 19
				 
				 if (slog19x < -47)                      // if it's less than -48 sorta 
				 begin
					slog19x <= 646;              // slog 19 loops back around to negative 1900 pixels
				 end 
				 else
				 begin
					slog19x <= (slog19x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 20
				 
				 if (slog20x < -47)                      // if it's less than -48 sorta 
				 begin
					slog20x <= 646;              // slog 20 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog20x <= (slog20x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 21
				 
				 if (slog21x < -47)                      // if it's less than -48 sorta 
				 begin
					slog21x <= 646;              // slog 21 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog21x <= (slog21x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 22
				 
				 if (slog22x < -47)                      // if it's less than -48 sorta 
				 begin
					slog22x <= 646;              // slog 22 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog22x <= (slog22x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 23
				 
				 if (slog23x < -47)                      // if it's less than -48 sorta 
				 begin
					slog23x <= 646;              // slog 23 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog23x <= (slog23x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
					
				//------small log 24
				 
				 if (slog24x < -47)                      // if it's less than -48 sorta 
				 begin
					slog24x <= 646;              // slog 24 loops back around to negative 100 pixels
				 end 
				 else
				 begin
					slog24x <= (slog24x + ~ (slogxstep) + 1'b1);  // Update slog position, slog 1 moves left
					end
		end  
    end
       
    

endmodule
