% Script to test the hsv2bw function
% Define the hue, saturation and value parameters of
% the tennis ball
h = [0;0.07];
s = [0.67;1];
v = [0.5;1];

% Read an RGB color space image from file
image = imread('cw.png');
% Convert the RGB color space image to an HSV color
% space image
image_hsv = rgb2hsv(image);
% Threshold the HSV color space image to an binary
% image
image_bw = hsv2bw(image_hsv,h,s,v);


figure;
imshow(image);
% Show the HSV image
figure;
imshow(image_hsv);
% Show the thresholded binary image
figure;
imshow(image_bw);