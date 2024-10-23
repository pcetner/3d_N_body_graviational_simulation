function [] = Distance3d_test_AI_2
  % Test 3: Test the function with points that have negative coordinates
  A = [-1, -2, -3];
  B = [-4, -5, -6];
  expected_distance = 5.1961524227066318805823390245176; % calculated using the correct formula

  % Call the function and store the result
  result = Distance3d(A, B);

  % Compare the result to the expected value using the assert function
  assert(abs(result - expected_distance) < 1e-15, ...
         sprintf('Test 3 Failed:\n   Points A=[%d, %d, %d] and B=[%d, %d, %d] have an expected distance of %f but returned a distance of %f', ...
         A(1), A(2), A(3), B(1), B(2), B(3), expected_distance, result));
end
