function [nextstate] = next(state, dt, g)
    % state and nextstate are a `struct`s with:
    % -mass (m)
    % -velocity (xvel, yvel, zvel) at that instant
    % -position (xpos, ypos, zpos) at the instant

    nbodies = numel(fieldnames(state)) -1;
    ALLbodys = [];
    ALLforces = [];

    for x = 1:nbodies
      str1 = sprintf("p%d", x);
      for y = x+1:nbodies
        str2 = sprintf("p%d", y);
        bodies = {str1, str2};
        ALLbodys = [ALLbodys, bodies];
        ALLforces = [ALLforces; force(state.(str1),state.(str2),g)];
      endfor
    endfor
    %%% The above for loop creates the arrays below.

    %%%{p1, p2}     [F_x,F_y,F_z]
    %%%{p1 p3}      [F_x,F_y,F_z]
    %%%{p1 p4}      [F_x,F_y,F_z]
    %%%{p2 p3}      [F_x,F_y,F_z]
    %%%{p2 p4}      [F_x,F_y,F_z]
    %%%{p3 p4}      [F_x,F_y,F_z]

    nextstate = state;
    nextstate.t = state.t + dt;

    for x = 1:nbodies
        sumF_x = 0;
        sumF_y = 0;
        sumF_z = 0;
        str1 = sprintf("p%d", x);
                for y = 1:rows(ALLforces)
                  if strcmp(ALLbodys{(y*2) - 1},str1) == true
                    F_x = ALLforces(y,1);
                    F_y = ALLforces(y,2);
                    F_z = ALLforces(y,3);

                    sumF_x = sumF_x + F_x;
                    sumF_y = sumF_y + F_y;
                    sumF_z = sumF_z + F_z;
                  endif
                  if strcmp(ALLbodys{y*2},str1) == true
                    F_x = ALLforces(y,1);
                    F_y = ALLforces(y,2);
                    F_z = ALLforces(y,3);

                    sumF_x = sumF_x - F_x;
                    sumF_y = sumF_y - F_y;
                    sumF_z = sumF_z - F_z;
                  endif
               endfor
        mass = state.(str1).m;
        a_xyz = [sumF_x, sumF_y, sumF_z] / mass;
        nextstate.(str1).pos = state.(str1).pos + state.(str1).vel * dt + .5 * a_xyz * dt^2;
        nextstate.(str1).vel = state.(str1).vel + a_xyz * dt;
    endfor
end
