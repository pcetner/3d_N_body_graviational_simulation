function [] = AI_TEST_KE_1()
  % Define the initial struct
  init = struct('t', 0, 'p1', struct('m', 1, 'pos', [1 1 1], 'vel', [0 0 1]), 'p2', struct('m', 1, 'pos', [-1 -1 -1], 'vel', [0 0 0]));

  % Define the gravitational constant
  g = 6.67430e-11;

  % Create the array of structs with two time steps using the next function
  traj = [init, next(init, .1, g)];

  % Call the KE function
  KEs = KE(traj, 2);

  % Compute the expected kinetic energy value
  m1 = init.p1.m;
  v1 = sqrt(init.p1.vel(1)^2 + init.p1.vel(2)^2 + init.p1.vel(3)^2);
  KE1 = .5 * m1 * v1^2;

  m2 = init.p2.m;
  v2 = sqrt(init.p2.vel(1)^2 + init.p2.vel(2)^2 + init.p2.vel(3)^2);
  KE2 = .5 * m2 * v2^2;

  % Compute the kinetic energy of the two bodies in the next state
  next_state = next(init, .1, g);
  m1 = next_state.p1.m;
  v1 = sqrt(next_state.p1.vel(1)^2 + next_state.p1.vel(2)^2 + next_state.p1.vel(3)^2);
  KE1_next = .5 * m1 * v1^2;

  m2 = next_state.p2.m;
  v2 = sqrt(next_state.p2.vel(1)^2 + next_state.p2.vel(2)^2 + next_state.p2.vel(3)^2);
  KE2_next = .5 * m2 * v2^2;

  expected_KEs = [KE1 + KE2, KE1_next + KE2_next];

  % Verify that the resulting array has the expected values
  tolerance = 0.02 * expected_KEs;  % 2% tolerance
  assert(all(abs(KEs - expected_KEs) <= tolerance), "Error: KE values are not within 2% tolerance")

end

