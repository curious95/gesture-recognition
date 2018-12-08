% Function that detects the center of a tennis
% ball in an image, returning it on a vector
% with pixels coordinates
function x = detect_ball_position(image,h,s,v)
% Convert the RGB color space image to an HSV
% color space format image
image = rgb2hsv(image);
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
x = [0 0];
% If the is one or more connected componentes,
% return the centroid of the biggest one
else
numPixels = cellfun(@numel,cc.PixelIdxList);
[~,idx] = max(numPixels);
x(1) = ball(idx).Centroid(1);
x(2) = ball(idx).Centroid(2);
end
end