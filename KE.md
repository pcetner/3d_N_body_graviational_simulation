# `KE`

Given the velocities of bodies through time, the kinetic energy of the system can be easily deterimined by the following formula:

```math
KE = 0.5mv^2
```

## Syntax

```matlab
[KEs] = KE(traj,nbodies)
```

## Description

`traj` is an array, composed of of numerous structs describing the state of a system at a given time. An example of one of those structs is shown below:

```matlab
init =

scalar structure containing the fields:
    t = 0
    p1 =
      scalar structure containing the fields:
        m = 1
        pos =
            1   1   1
        vel =
            0   0   1
    p2 =
      scalar structure containing the fields:
        m = 1
        pos =
            -1  -1  -1
        vel =
            0   0   0
```

`nbodies` is an integer that represents the number of bodies in each state of the trajectory. In the given example, there are two bodies, `p1` and `p2`, hence, nbodies would equal two.

## Examples

If we run `traj = trajectory(init, 0.1, 0.1, g)`, with `init`  being the struct defined above, and `g` being equal to the gravitiational constant, then a trajectory array with two states in time can be created. 

```matlab
>> traj = trajectory(init, T, dt, g)
traj =
  1x2 struct array containing the fields:
    t
    p1
    p2
>>
```

Given that information, we can see what the kinetic energy of the system is at each time with the following:

```matlab
>> a = KE(traj,2)
a =
   0.5000   0.5000
>>
```

Note that the while kinetic energy appears to be the same in both states, that is not actually the case. The values appear the same due to rounding error, as the timestep is small. It is logical that such a system would experience minimal change over a very short timeframe. The following lines demonstrate that the two values are not equal:

```matlab
>> a(1) == a(2)
ans = 0
>>
```

For an additional example of this function running, please see `demo_3_bodies.m`, which shows kinetic energy being plotted as a function of time. 

## Theory

Kinetic energy is defined by the following formula:

```math
KE = 0.5mv^2
```

Given the velocities and masses of many bodies at a given state in time, we can easily find the system's kinetic energy at that time by summing up the kinetic energies of each of the bodies. 
