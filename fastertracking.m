% Script that detects a tennis ball in a video
% Create a video input object from a camera

vid1 = videoinput('winvideo',1,'YUY2_640x480');
x=[0 0];
% Set the properties of the video object
vid1.FramesPerTrigger = 1;
vid1.TriggerRepeat = Inf;
triggerconfig(vid1,'manual');
vid1.ReturnedColorspace = 'rgb';
% Create video source object from a video input object
src = getselectedsource(vid1);
% Define the HSV parameters to isolate the ball

%blue
h = [0.12;0.18];
s = [0.44;0.7];
v = [0.5;1];

%blue
% Define the initial region of interest
roi = [0 0 640 480];
% Start video aquisition
start(vid1);
% Infinite loop until the user presses a key
while (vid1.FramesAcquired<200)
tic;
% Trigger the camera
trigger(vid1);
% Get the current frame data from the camera
frame = getdata(vid1);
% Show the current frame
imshow(frame);

% Crop the current frame
frame = imcrop(frame,roi);
% Detect ball position in current frame
x=detect_ball_position(frame,h,s,v);
% Adjust ball position
if(x~=0)
x = adjust_position(x,roi);
% Update region of interest
roi = update_roi(x);
% Plot the center of the ball and the region of
% interest in the current frame
hold on;
plot(x(1),x(2),'r.');
plot(x(1)-roi(3)/2,x(2)-roi(4)/2,'g*');
plot(x(1)+roi(3)/2,x(2)-roi(4)/2,'g*');
plot(x(1)-roi(3)/2,x(2)+roi(4)/2,'g*');
plot(x(1)+roi(3)/2,x(2)+roi(4)/2,'g*');
hold off;
movems(x(1),x(2));

else
end
end
imshow(l);
% Stop the video aquisition
stop(vid1);
% Flush all the image data stored in the memory buffer
flushdata(vid1);
% Clear all variables
clear all