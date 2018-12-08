% Function that updates the region of interest that the
% tennis ball should be
function roi = update_roi(x)
% If no ball has been found in the previous frame,
% change the region of interest to be the full
% frame

if x(1)>=80 & x(2)>=60
roi(1) = x(1)-80;
roi(2) = x(2)-60;
roi(3) = 160;
roi(4) = 120;
    
    
    
    
   
% Otherwise, change the region of interest to be
% centralized in the ball's position and with
% smaller dimensions
else 
roi(1) = 0;
roi(2) = 0;
roi(3) = 640;
roi(4) = 480;
end
end
