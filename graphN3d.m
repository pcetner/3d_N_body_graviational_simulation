function [] = graphN3d (positions,numbodies,pausetime,titlestr,axisarr)
    figure(1, 'position',[50,50,1800,1000]);
    text(-4,13,-4, "Warning, do not manually rotate the graph until plotting is completed.",'fontsize', 23);
    axis(axisarr);
    pause(2);
    angle = 2;
    for x = 1:numel(positions.p1(:,1))
      plot3(positions.p1(1:x, 1), positions.p1(1:x, 2), positions.p1(1:x, 3), '-b');
      hold on;
      title(titlestr);
      xlabel("X");
      ylabel("Y");
      zlabel("Z");
      axis(axisarr);
      scatter3(positions.p1(x, 1), positions.p1(x, 2), positions.p1(x, 3), 'b', 'filled');%, 'markerfacecolor', 'b', 'markeredgecolor', 'k', 'markersize', 10);
      for y = 2:numbodies
        str3 = sprintf("p%d",y);
        plot3(positions.(str3)(1:x, 1), positions.(str3)(1:x, 2), positions.(str3)(1:x, 3), '-b' );
        scatter3(positions.(str3)(x, 1), positions.(str3)(x, 2), positions.(str3)(x, 3), 'b' , 'filled');%, 'markerfacecolor', 'r', 'markeredgecolor', 'k', 'markersize', 10);
      endfor
      if (x == numel(positions.p1(:,1)))
        hold on;
        break;
      endif
      pause(pausetime);
      hold off;

   endfor
   hold off;
endfunction
