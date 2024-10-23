function demo_2_bodies_approach()
    p1.m=14^9;
    p1.pos = [2 2 3];
    p1.vel = [-.2 -.2 -.2];
    %%%-------
    p2 = p1;
    p2.pos = [-2 -1 2];
    p2.vel = [.2 .2 .5];

    numbodies = 2;
    g = 6.67408 * 10^-11;

    init.t = 0;
    init.p1 = p1;
    init.p2 = p2;

    dt = .125;
    traj = trajectory(init, 101 * dt, dt, g);

    figure(1, 'position',[50,50,1800,1000]);
    plot3(0,0,0);
    hold on;
    axis([-10 10 -10 10 -10 10]);

    %%% This graphing is done here to allow for two different colored bodies.
    xlabel("X");
    ylabel("Y");
    zlabel("Z");
    title("Gravitating Bodies");

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

    for x = 1:numel(positions.p1(:,1))
      plot3(positions.p1(1:x, 1), positions.p1(1:x, 2), positions.p1(1:x, 3), '-b');
      hold on;
      xlabel("X");
      ylabel("Y");
      zlabel("Z");
      title("Minimum distance between two approaching bodies");
      axis([-10 10 -10 10 -10 10]);
      plot3(positions.p1(x, 1), positions.p1(x, 2), positions.p1(x, 3), 'o', 'markerfacecolor', 'b', 'markeredgecolor', 'k', 'markersize', 10);
      plot3(positions.p2(1:x, 1), positions.p2(1:x, 2), positions.p2(1:x, 3), '-r' );
      plot3(positions.p2(x, 1), positions.p2(x, 2), positions.p2(x, 3), 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'k', 'markersize', 10);
      pause(.01);
      if (x == numel(positions.p1(:,1)))
        hold on;
        break;
      endif
      hold off;
   endfor
   [time,dist,idx] = min_approach_distance(traj);
   pointA = positions.p1(idx,:);
   pointB = positions.p2(idx,:);
   v=[pointA;pointB];
   plot3(v(:,1),v(:,2),v(:,3),'g-')
   hold off;
end
