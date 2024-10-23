function [maxKE, time] = max_KE(traj,nbodies)
  %%% This utility function calculates the distance of closest approch between two bodies based off of their inputed trajectories,
  %%% It returns an array with the [time, distance] of the minimum distance.
  startT = traj(1).t;
  endT = traj(end).t;
  total = numel(traj)-1;
  dt = (endT-startT)/total;
  KEs = KE(traj,nbodies);
  maxKE = max(KEs);
  idx = find(maxKE == KEs);
  time = startT + dt * idx;
end
