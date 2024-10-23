function [interptime, dist, noninterpIDX] = min_approach_distance(traj)
  %%% This function calculates the distance of closest approch between two bodies based off of their inputed trajectories,
  %%% It returns an array with the [interpolated time of minimum distance, interpolated distance,non-interpolated index]

  %%% As a more complex proof of this function working, see demo_2_bodies_approach.m
  %%% Using the returned noninterpIDX to find the location of the minimum, a green line is plotted between the two positions at that time.
  %%% The minimum occours at the correct time in the demo.

  startT = traj(1).t;
  endT = traj(end).t;
  total = numel(traj);
  dt = (endT-startT)/total;
  Apos = [];
  Bpos = [];
  for x = 1:total
      tempA = traj(x);
      tempA = tempA.p1.pos;
      Apos = [Apos;tempA];
      %
      tempB = traj(x);
      tempB = tempB.p2.pos;
      Bpos = [Bpos;tempB];
  endfor
  distances = [];
  for x = 1:total
    distances = [distances ; Distance3d(Apos(x,:),Bpos(x,:))];
  endfor
  oldxp = [startT:dt:endT];
  numel(distances);
  numel(oldxp(1,2:end));
  xp = [startT:dt/20:endT];
  yp = interp1(oldxp(1,2:end),(distances),xp,'spline');
  INTERP = min(yp);
  dist = min(INTERP);
  idx = find(yp == dist);
  interptime = xp(idx);
  noninterpIDX = find(distances == min(distances));
end
