function [] = min_approach_distance_test_AI_1
  % Define the initial and next states
  init = struct('t', 0, 'p1', struct('pos', [1 1 1]), 'p2', struct('pos', [-1 -1 -1]));
  next_state = struct('t', 1, 'p1', struct('pos', [1 2 1]), 'p2', struct('pos', [-1 -1 -2]));

  % Create the array of structs with two time steps
  traj = [init, next_state];

  % Call the min_approach_distance function
  [interptime, dist, noninterpIDX] = min_approach_distance(traj);

  % Define the expected values
  expected_interptime = 0.5;
  expected_dist = sqrt(12);
  expected_noninterpIDX = 1;

  % Verify that the output of the function is correct
  tolerance = 1e-6;  % tolerance for numerical errors
  assert(abs(interptime - expected_interptime) <= tolerance, "Error: interptime is not as expected. Expected: %f, Actual: %f", expected_interptime, interptime)
  assert(abs(dist - expected_dist) <= tolerance, "Error: dist is not as expected. Expected: %f, Actual: %f", expected_dist, dist)
  assert(noninterpIDX == expected_noninterpIDX, "Error: noninterpIDX is not as expected. Expected: %d, Actual: %d", expected_noninterpIDX, noninterpIDX)

end
