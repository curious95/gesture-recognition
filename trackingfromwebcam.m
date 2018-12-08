% Script that detects a tennis ball in a video
% Create a video input object from a camera
vid = videoinput('winvideo',1,'YUY2_640x480');
% Set the properties of the video object
vid.FramesPerTrigger = 1;
vid.TriggerRepeat = Inf;
triggerconfig(vid,'manual');
vid.ReturnedColorspace = 'rgb';
% Create video source object from a video input object
src = getselectedsource(vid);
% Set the properties of the video source object
src.BacklightCompensation = 'off';
src.ExposureMode = 'manual';
src.FocusMode = 'manual';
src.WhiteBalanceMode = 'manual';
src.Brightness = 128;
src.Contrast = 32;
src.Exposure = -2;
src.Focus = 0;
src.Gain = 64;
src.Saturation = 64;
src.Sharpness = 0;
src.WhiteBalance = 4096;
% Define the HSV parameters to isolate the ball
h = [0.1020 0.4627];
s = [0.1373 1.0000];
v = [0.1725 0.8118];
% Start video aquisition
start(vid);
% Infinite loop until the user presses a key
while (1)
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
end
% Stop the video aquisition
stop(vid);
% Flush all the image data stored in the memory buffer
flushdata(vid);
% Clear all variables
clear all