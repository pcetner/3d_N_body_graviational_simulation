function [f] = force(A,B,g)
  %%% This utility function calculates the force between two bodies, A and B, based off of what you provided me during our meeting.
  delta = A.pos - B.pos;
  f = -delta * g *A.m*B.m / Distance3d(A.pos,B.pos)^3;
end
