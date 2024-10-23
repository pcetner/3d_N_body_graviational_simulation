function demo_2_bodies_orbit()
    g = 6.67408 * 10^-11;

    p1.m= 10^11;
    p1.pos = [0 0 1];
    p1vel = sqrt((g * p1.m)/(4 *  p1.pos(3)));
    p1.vel = [0 p1vel 0];
    % % %
    p2 = p1;
    p2.pos = p1.pos * -1;
    p2.vel = p1.vel * -1;

    init.t = 0;
    init.p1 = p1;
    init.p2 = p2;

    numbodies = 2;

    %%% This graphing is done here to allow for two different colored bodies.
    figure(1, 'position',[50,50,1800,1000]);
    plot3(0,0,0);
    hold on;

    axis([-10 10 -10 10 -10 10]);
    xlabel("X");
    ylabel("Y");
    zlabel("Z");
    title("Gravitating Bodies");

    dt = .125;
    traj = trajectory(init, 1601 * dt, dt,g);

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

   for x = 1:numel(positions.p1(:,1))
      plot3(positions.p1(1:x, 1), positions.p1(1:x, 2), positions.p1(1:x, 3), '-b');
      hold on;
      xlabel("X");
      ylabel("Y");
      zlabel("Z");
      title("Two orbiting bodies");
      axis([-10 10 -10 10 -10 10]);
      plot3(positions.p1(x, 1), positions.p1(x, 2), positions.p1(x, 3), 'o', 'markerfacecolor', 'b', 'markeredgecolor', 'k', 'markersize', 10);
      plot3(positions.p2(1:x, 1), positions.p2(1:x, 2), positions.p2(1:x, 3), '-r' );
      plot3(positions.p2(x, 1), positions.p2(x, 2), positions.p2(x, 3), 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'k', 'markersize', 10);
      pause(.1);
      if (x == numel(positions.p1(:,1)))
        hold on;
        break;
      endif
      hold off;
   endfor
   hold off;
end
