function [KEs] = KE(traj,nbodies)
    total = numel(traj);
    KEs = [];
    for levels = 1:total
      thatlevel = 0;
      for x = 1:nbodies
        str1 = sprintf("p%d", x);
        tempA = traj(levels);
        tempAvel = tempA.(str1).vel;
        mag_vel = sqrt(tempAvel(1)^2 + tempAvel(2)^2 + tempAvel(3)^2);
        tempAm = tempA.(str1).m;
        thatlevel = thatlevel + (.5 * tempAm *  mag_vel^2);
      endfor
      KEs(levels) = thatlevel;
    endfor
end
