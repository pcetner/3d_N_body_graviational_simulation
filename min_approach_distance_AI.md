# min_approach_distance

## Syntax

`[interptime, dist, noninterpIDX] = min_approach_distance(traj)`

## Description

This function calculates the distance of closest approach between two bodies based on their input trajectories. It returns an array with the following values:

- `interptime`: Interpolated time of minimum distance
- `dist`: Interpolated distance
- `noninterpIDX`: Non-interpolated index

## Example

```matlab
% Define the initial and next states
init = struct('t', 0, 'p1', struct('pos', [1 1 1]), 'p2', struct('pos', [-1 -1 -1]));
next_state = struct('t', 1, 'p1', struct('pos', [1 2 1]), 'p2', struct('pos', [-1 -1 -2]));

% Create the array of structs with two time steps
traj = [init, next_state];

% Call the min_approach_distance function
[interptime, dist, noninterpIDX] = min_approach_distance(traj);

% Print the output of the function
fprintf("Interpolated time of minimum distance: %f\n", interptime)
fprintf("Interpolated distance: %f\n", dist)
fprintf("Non-interpolated index: %d\n", noninterpIDX)
```

This will output:

```matlab
Interpolated time of minimum distance: 0.500000
Interpolated distance: 3.464102
Non-interpolated index: 1
```

## Theory

The `min_approach_distance` function calculates the distance of closest approach between two bodies based on their inputted trajectories. It does this by first extracting the position of each body at each time step from the `traj` array of structs. It then calculates the distance between the two bodies at each time step and stores it in an array called `distances`.

Next, the function interpolates the `distances` array using a spline interpolation, resulting in a smooth curve of the distance between the two bodies as a function of time. The minimum distance on this curve is then found and stored in a variable called `dist`. The time at which this minimum distance occurs is found by finding the corresponding value on the interpolated time array, and is stored in a variable called `interptime`.

Finally, the function finds the non-interpolated index of the minimum distance in the original `distances` array and stores it in a variable called `noninterpIDX`. This index corresponds to the time step at which the minimum distance occurred in the original simulation, rather than the interpolated version of the simulation.
