function [] = GRAVITATING_BODIES_test_A_due_to_Earth
  g = 6.67408 * 10^-11;

  p1.m= 5.97219 * 10^24; %%Earth
  p1.pos = [0 0 0];
  p1.vel = [0 0 0];
  % % %
  p2.m = 1; %1kg test mass
  p2.pos = [0 0  6371000]; %% radius of earth
  p2.vel = [0 0 0];

  init.t = 0;
  init.p1 = p1;
  init.p2 = p2;

  dt = .0000001;
  traj = trajectory(init, dt, dt,g);
  startVEL = 0;
  endstate = traj(2).p2;
  finalvel = endstate.vel; %%slight simplification here, based off the starting conditions there will only be a z velocity.

  endVEL = abs(finalvel(3)/dt);   %%A = V/t

  assert(endVEL > 9.8 & endVEL < 9.83,'\nERROR! Given the mass of the earth and a 1kg test mass set the radius of the earth apart, the acceleration of the test mass should equal 9.8 m/s.\n');
end
