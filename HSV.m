% Script to test the hsv2bw function
% Define the hue, saturation and value parameters of
% the tennis ball
h = [0.1569;0.2000];
s = [0.3922;1.0000];
v = [0.6973;1.0000];
% Read an RGB color space image from file
image = imread('new2.jpg');
% Convert the RGB color space image to an HSV color
% space image
image_hsv = rgb2hsv(image);
% Threshold the HSV color space image to an binary
% image
image_bw = hsv2bw(image_hsv,h,s,v);
% Show the RGB image
figure;
imshow(image);
% Show the HSV image
figure;
imshow(image_hsv);
% Show the thresholded binary image
figure;
imshow(image_bw);