function [] = Distance3d_test
  A = [1 1 1];
  B = A * -1;

  octavedistance = norm( A - B , 2 ); %% I realized that there already was a function for this after I made my own...
  mydist = Distance3d(A,B);

  assert(mydist == octavedistance,'\nERROR! Crosscheck between Distance3d and octaves norm() function failed.\n');
end
