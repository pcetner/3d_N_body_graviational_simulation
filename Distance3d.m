function [r] = Distance3d(A,B)
  %%% This utility function calculates the distance between two points in a 3d space.
  %%% A and B are 3d points represented by [x,y,z]
  r = sqrt((A(1)-B(1))^2 + (A(2)-B(2))^2 + (A(3)-B(3))^2);
end
