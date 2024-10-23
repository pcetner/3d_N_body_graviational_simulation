function retval = graphENERGY (traj, numbodies,g,depth)
   KinE = KE(traj,numbodies);
   PotE = GPE(traj,numbodies,g);
   TotE = abs(KinE + PotE);

   subplot(3,1,1)
      title('Kinetic Energy');
      xlabel('Time');
      ylabel('Amount');
      hold on;
      plot(0:depth,KinE);
      hold off;
   subplot(3,1,2)
      title('Potential Energy');
      xlabel('Time');
      ylabel('Amount');
      hold on;
      plot(0:depth,PotE);
      hold off;
   subplot(3,1,3)
      title('Total Energy');
      xlabel('Time');
      ylabel('Amount');
      axis([0, 1.1 * depth, 0, 1.1 * max(TotE) ])
      hold on;
      plot(0:depth,abs(TotE));
      hold off;
    %verify max_KE function works by uncommenting the below lines and comparing to the plot
    %[ammount,maxtime] = max_KE(traj,numbodies)
    %maxtime/dt;
endfunction
