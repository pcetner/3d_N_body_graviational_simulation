function [] = Distance3d_test_AI_1
  % Test 1: Check distance between two points
  A = [1, 2, 3];
  B = [4, 5, 6];
  expected_output = 5.196152; % sqrt((4-1)^2 + (5-2)^2 + (6-3)^2)

  assert(abs(Distance3d(A, B) - expected_output) < 1e-6, 'Distance3d function failed test case 1. \n   Input points: A=[%d, %d, %d], B=[%d, %d, %d]\n     Expected output: %f\n     Actual output: %f ', A(1), A(2), A(3), B(1), B(2), B(3), expected_output, Distance3d(A, B))
end
