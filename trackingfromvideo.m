%Script that detects a tennis ball in a video
% Create a video input object from a camera
vid = videoinput('winvideo',2,'YUY2_640x480');
% Set the properties of the video object
vid.FramesPerTrigger = 1;
vid.TriggerRepeat = Inf;
triggerconfig(vid,'manual');
vid.ReturnedColorspace = 'rgb';
% Create video source object from a video input object
src = getselectedsource(vid);
n=0;
% Define the HSV parameters to isolate the ball
h = [0.25;0.5];
s = [0.67;1];
v = [0.5;1];

% Start video aquisition
start(vid);
% Infinite loop until the user presses a key
while (vid.FramesAcquired<100)
    tic;
% Trigger the camera
trigger(vid);
% Get the current frame data from the camera
frame = getdata(vid);
% Detect ball position in current frame
x = detect_ball_position(frame,h,s,v);
movems(x(1),x(2));

imshow(frame);
hold on;
% Show the current fram
% Plot the center of the ball in the current frame
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