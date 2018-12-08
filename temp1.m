% Script that detects a tennis ball in a video
% Create a video input object from a camera
vid = videoinput('winvideo',2,'YUY2_640x480');
% Set the properties of the video object
vid.FramesPerTrigger = 1;
vid.TriggerRepeat = Inf;
triggerconfig(vid,'manual');
vid.ReturnedColorspace = 'rgb';
n=0;
% Create video source object from a video input object
src = getselectedsource(vid);
% Set the properties of the video source object
src.BacklightCompensation = 'off';



src.Brightness = 100;
src.Contrast = 32;
src.Saturation = 4;
src.Sharpness = 0;

% Define the HSV parameters to isolate the ball
h = [0.1020 0.4627];
s = [0.1373 1.0000];
v = [0.1725 0.8118];
% Start video aquisition
start(vid);
% Infinite loop until the user presses a key
while (n<100)
% Trigger the camera
trigger(vid);
% Get the current frame data from the camera
frame = getdata(vid);
% Detect ball position in current frame
x = detect_ball_position(frame,h,s,v);
% Show the current frame
imshow(frame);
% Plot the center of the ball in the current frame
hold on;
plot(x(1),x(2),'r.');
hold off;
n=n+1;
end
% Stop the video aquisition
stop(vid);
% Flush all the image data stored in the memory buffer
flushdata(vid);
% Clear all variables
clear all