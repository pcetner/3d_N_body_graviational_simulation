function minAPPROACHtest()
    p1.m=14^9;
    p1.pos = [0 0 0];
    p1.vel = [0 0 0];
    %%%-------
    p2 = p1;
    p2.pos = [0 0 1];
    p2.vel = [0 0 0];

    numbodies = 2;
    g = 6.67408 * 10^-11;

    init.t = 0;
    init.p1 = p1;
    init.p2 = p2;

    dt = .125;
    traj = trajectory(init, 2 * dt, dt, g); %%final traj will have 3 states
    startpos = traj(1).p2;
    startpos = startpos.pos(3);
    endposA = traj(3).p2;
    endposA = endposA.pos(3);
    endposB = traj(3).p1;
    endposB = endposB.pos(3);
    finalDIF = abs(endposA-endposB);
    [interptime, dist, noninterpIDX] = min_approach_distance(traj);
    assert(finalDIF == dist & noninterpIDX == 3,'\nERROR! Given two motionless particles a distance appart from each other, and some small time to simulate, the minimum distance should occour at the last time simulated.\n');

end
