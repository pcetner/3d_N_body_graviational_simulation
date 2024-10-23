function [] = GRAVITATING_BODIES_test_next_states_simple
  p1.m=100000000;
  p1.pos = [1 1 1];
  p1.vel = [0 .005 .01];
  % % %
  p2 = p1;
  p2.pos = p1.pos * -1;
  p2.vel = [0 0 -.01];

  init.t = 0;
  init.p1 = p1;
  init.p2 = p2;
  g = 6.67408 * 10^-11;

  dt = .1;
  traj = trajectory(init, 2 * dt, dt, g);

  p1_ = traj.p1;
  p1_end = p1_(end);

  Aendxpos = p1_end.pos(1);
  Aendypos = p1_end.pos(2);
  Aendzpos = p1_end.pos(3);
  Aendxvel = p1_end.vel(1);
  Aendyvel = p1_end.vel(2);
  Aendzvel = p1_end.vel(3);

  p2_ = traj.p2;
  p2_end = p2_(end);

  Bendxpos = p2_end.pos(1);
  Bendypos = p2_end.pos(2);
  Bendzpos = p2_end.pos(3);
  Bendxvel = p2_end.vel(1);
  Bendyvel = p2_end.vel(2);
  Bendzvel = p2_end.vel(3);

  DistA = Distance3d([0 0 0],[Aendxpos, Aendypos, Aendzpos]);
  DistB = Distance3d([0 0 0],[Bendxpos, Bendypos, Bendzpos]);

  endvelA = Distance3d([0 0 0],[abs(Aendxvel), abs(Aendyvel), abs(Aendzvel)]);
  endvelB = Distance3d([0 0 0],[abs(Bendxvel), abs(Bendyvel), abs(Bendzvel)]);

  assert((endvelA > 0) & (endvelB > 0) & (DistA < 1.733) & (DistB < 1.733),'\nERROR! Two motionless particles in space should attract each other!\n');
end
