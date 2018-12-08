% Function that adjust the position of the tennis ball
% to relative to the main frame, and not to the cropped
% frame (roi)
function x = adjust_position(x,roi)
if ~isempty(x)
x(1) = x(1)+roi(1);
x(2) = x(2)+roi(2);
end
end