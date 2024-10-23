function [] = Distance3d_test_AI_4
  % Test 5: Test the function with points that are very far apart
  A = [0, 0, 0];
  B = [1e9, 0, 0];
  expected_distance = 1e9; % calculated using the correct formula

  % Call the function and store the result
  result = Distance3d(A, B);

  % Compare the result to the expected value using the assert function
  assert(abs(result - expected_distance) < 1e-15, ...
         'Test 5 Failed: \nPoints A=[%d, %d, %d] and B=[%d, %d, %d] have an expected distance of %f but returned a distance of %f', ...
         A(1), A(2), A(3), B(1), B(2), B(3), expected_distance, result);

  % If the test passes, do not display any output
end
