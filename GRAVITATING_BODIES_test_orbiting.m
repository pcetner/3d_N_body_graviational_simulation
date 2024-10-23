function [] = GRAVITATING_BODIES_test_orbiting
  g = 6.67408 * 10^-11;

  p1.m= 10^11;
  p1.pos = [0 0 1];
  p1vel = sqrt((g * p1.m)/(4 *  p1.pos(3)));
  p1.vel = [0 p1vel 0];
  % % %
  p2 = p1;
  p2.pos = p1.pos * -1;
  p2.vel = p1.vel * -1;

  init.t = 0;
  init.p1 = p1;
  init.p2 = p2;

  dt = [.5 .25 .125 .0625];
  displacements = [];
  for x = 1:numel(dt)
    traj = trajectory(init, 5, dt(x),g);
    last = traj(end);
    p1_end = last.p1;
    Aendxpos = p1_end.pos(1);
    Aendypos = p1_end.pos(2);
    Aendzpos = p1_end.pos(3);
    DistA = Distance3d([0 0 0],[Aendxpos, Aendypos, Aendzpos]);
    displacements(x) = (DistA);
  endfor
  for x = 1:numel(displacements)-1
    change(x) = displacements(x) - displacements(x+1);
  endfor
  %% Note, displacments should be an array of decreasing numbers as dt gets smaller.
  assert((sort(change) == flip(change,2)) & change(end) > 0,'\nERROR! As dt decrease, two particles with a velocity of +/- sqrt((gm)/(4r)) and r radius from the origon should approach a circular orbit.\n');
end
