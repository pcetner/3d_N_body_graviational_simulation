function [PEs] = GPE(traj,nbodies,g)
    total = numel(traj);
    PEs = [];
    for levels = 1:total
      thatlevel = 0;
      for x = 1:nbodies-1
        energy = 0;
        str1 = sprintf("p%d", x);
        tempA = traj(levels);
        tempApos = tempA.(str1).pos;
        tempAm = tempA.(str1).m;
        for y = x+1:nbodies
          str2 = sprintf("p%d", y);
          tempBpos = tempA.(str2).pos;
          tempBm = tempA.(str2).m;
          energy = energy - ((tempAm * tempBm * g)/Distance3d(tempApos,tempBpos));
        endfor
        thatlevel = thatlevel + energy;
      endfor
      PEs(levels) = thatlevel;
    endfor
    %plot(1:levels,PEs)
end
