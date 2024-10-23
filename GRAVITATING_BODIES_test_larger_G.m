function [] = GRAVITATING_BODIES_test_larger_G
  g1 = 6.67408 * 10^-11;
  g2 = 1;

  p1.m= 5.97219 * 10^24; %%Earth
  p1.pos = [0 0 0];
  p1.vel = [0 0 0];
  p2.m = 1; %1kg test mass
  p2.pos = [0 0  6371000]; %% radius of earth
  p2.vel = [0 0 0];

  init.t = 0;
  init.p1 = p1;
  init.p2 = p2;

  dt = .0000001;
  trajlo = trajectory(init, 10 * dt, dt, g1);
  trajhi = trajectory(init, 10 * dt, dt, g2);

  endstateLO = trajlo(10).p2;
  finalLO = abs(endstateLO.vel);
  endstateHI = trajhi(10).p2;
  finalHI = abs(endstateHI.vel);

  assert(finalHI(3) > finalLO(3),'\nERROR! Given the same initial states, with a different gravitational constant, the higher gravitational constant should cause larger changes in velocity over the same period of time.\n');
end
