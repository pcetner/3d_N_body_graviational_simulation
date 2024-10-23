function [path] = trajectory(init, T, dt, g)
    %% This is a function that was provided to us. It calculates a struct with various states of the system at each time.

    % init is the initial state `struct` with fields ...
    % T is the total time to simulate
    % dt is the time-step

    path = init;
    for time = dt:dt:T
        path(end+1) = next(path(end),dt,g);
    end
end
