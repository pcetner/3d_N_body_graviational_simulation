function demo_totalE_changing_dt()
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

    total = [1125 2250 4500 9000 18000];
    dt = [.08 .04 .02 .01 .005];

    plot(0,0);
    for x = 1:numel(total)
      fprintf("Calculating trajectories...  %d/%d\n",x,numel(total));
      str1 = sprintf("t%d",x);
      traj = trajectory(init, total(x) * dt(x), dt(x),g);
      KinE.(str1) = KE(traj,numbodies);
      PotE.(str1) = GPE(traj,numbodies,g);
      TotE.(str1) = abs(KinE.(str1) + PotE.(str1));
    endfor
    title('Total Energy as Timestep Decreases');
    xlabel('Time');
    ylabel('Amount');
    axis([0, 1.1 * total(1), 0, 1.1 * max(TotE.t1) ]);
    hold on;
    plot(0:total(1),abs(TotE.t1));
    pause(.8);
    plot([1:.5:total(1)+1],abs(TotE.t2));
    pause(.8);
    plot([1:.25:total(1)+1],abs(TotE.t3));
    pause(.8);
    plot([1:.125:total(1)+1],abs(TotE.t4));
    pause(.8);
    plot([1:.0625:total(1)+1],abs(TotE.t5));
end
