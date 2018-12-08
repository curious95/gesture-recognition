function [ output_args ] = green( frame )
%GREEN Summary of this function goes here
%   Detailed explanation goes here
h = [0.25;0.5];
s = [0.67;1];
v = [0.5;1];

image = rgb2hsv(frame);
% Threshold the HSV color space image to an
% binary image
image = hsv2bw(image,h,s,v);
% Label all the connected components in the
% thresholded binary image
cc = bwconncomp(image);
% Mesures the centroid for each all the
% connected components
ball = regionprops(cc,'Centroid');
% If there is no connected components, return
% an empty vector
if isempty(ball)
clickrel();
% If the is one or more connected componentes,
% return the centroid of the biggest one
else
clickhold();
numPixels = cellfun(@numel,cc.PixelIdxList);
[~,idx] = max(numPixels);
x(1) = ball(idx).Centroid(1);
x(2) = ball(idx).Centroid(2);
end
end


