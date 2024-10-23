function demo_3_bodies()
    p1.m=10^10;
    p1.pos = [1 1 1];
    p1.vel = [0 .4 .01];
    %%%-------
    p2 = p1;
    p2.pos = [1 3 -4];
    p2.vel = [-.2 -.6 -.01];
    %%%-------
    p3 = p1;
    p3.pos = [-1,-1,3];
    p3.vel = [0 -.2 0.01];

    numbodies = 3;
    g = 6.67408 * 10^-11;

    init.t = 0;
    init.p1 = p1;
    init.p2 = p2;
    init.p3 = p3;

    figure(1, 'position',[50,50,1800,1000]);
    plot3(0,0,0);
    hold on;
    axis([-20 20 -20 20 -20 20]);

    xlabel("X");
    ylabel("Y");
    zlabel("Z");
    titlestr = "Three bodies demo, 0.04 second timestep";

    dt = .04;
    total = 2250;
    traj = trajectory(init, total * dt, dt,g);

   for y = 1:numbodies
     str1 = sprintf("p%d",y);
     positions.(str1) = [];
   endfor

   for x = 1:numel(traj)/4
     a = traj(x * 4);
     for y = 1:numbodies    %%%replace with number of bodies in traj
       str1 = sprintf("p%d",y);
       positions.(str1) = [positions.(str1); a.(str1).pos(1), a.(str1).pos(2), a.(str1).pos(3)];
     endfor
   endfor

   axisarr = [-20 20 -20 20 -20 20];
   graphN3d(positions,numbodies,.0001,titlestr, axisarr);
   figure(2, 'position',[900,100,400,1000]);
   graphENERGY(traj, numbodies,g,total);
end
