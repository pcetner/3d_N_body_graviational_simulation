function demo_7_bodies()
    %%%-------
    p1.m = 10^11;
    p1.pos = [1 1 1];
    p1.vel = [.3 -.6 -1];
    %%%-------
    p2 = p1;
    p2.pos = [2 2 2];
    p2.vel = [-.2 -.6 -.01];
    %%%-------
    p3 = p1;
    p3.pos = [3,3,3];
    p3.vel = [0 2 0.01];
    %%%-------
    p4 = p1;
    p4.pos = [4 4 4];
    p4.vel = [-.2 -.6 -.01];
    %%%-------
    p5 = p1;
    p5.pos = [5 5 5];
    p5.vel = [-.2 -.6 +2];
    %%%-------
    p6 = p1;
    p6.pos = [6 6 6];
    p6.vel = [3 -.6 -1.01];
    %%%-------
    p7 = p1;
    p7.pos = [7 7 7];
    p7.vel = [-.2 .6 -.01];

    numbodies = 7;

    %below is a useful line to find the sum of the x,y,z velocity of each planet.
    %tempsumvel = p1.vel + p2.vel + p3.vel

    g = 6.67408 * 10^-11;

    init.t = 0;
    init.p1 = p1;
    init.p2 = p2;
    init.p3 = p3;
    init.p4 = p4;
    init.p5 = p5;
    init.p6 = p6;
    init.p7 = p7;

    figure(1, 'position',[50,50,1800,1000]);
    plot3(0,0,0);
    hold on;
    axisarr = [-15 15 -15 15 -15 15];

    xlabel("X");
    ylabel("Y");
    zlabel("Z");
    titlestr = "Seven body demo";


    dt = .01;
    total = 200;
    traj = trajectory(init, total * dt, dt,g);

    for y = 1:numbodies
     str1 = sprintf("p%d",y);
     positions.(str1) = [];
    endfor

    for x = 1:numel(traj)
      a = traj(x);
      for y = 1:numbodies    %%%replace with number of bodies in traj
        str1 = sprintf("p%d",y);
        positions.(str1) = [positions.(str1); a.(str1).pos(1), a.(str1).pos(2), a.(str1).pos(3)];
      endfor
    endfor
    pausetime = .01;
    graphN3d(positions,numbodies,pausetime,titlestr,axisarr);
end
