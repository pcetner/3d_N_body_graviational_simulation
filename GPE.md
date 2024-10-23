# GPE

Given the postitions of bodies through time, the gravitational potential energy of the bodies at each time can be easily deterimined by the following formula:

```math
GPE = -gm_1m_2/r
```

By applying the formula to each unique pair of all bodies in the system, we can sum them together and find the total gravitational potential energy at a given time. We can then create an array of the gravitational potential energy of the system through time

## Syntax

```matlab
[PEs] = GPE(traj,nbodies,g)
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

`g` represents the gravitational constant.

## Examples

If we run `traj = trajectory(init, T, dt, g)`, with `init` being the struct defined above, `g` being equal ot the gravitiational constant, `T` = .1, and `dt`=.1 then a trajectory array with two states in time can be created. 

```matlab
>> traj = trajectory(init, T, dt, g)
traj =
  1x2 struct array containing the fields:
    t
    p1
    p2
>>
```

Given that information, we can see what the gravitational potential energy of the system is at each time with the following:

```matlab
>> GPE(traj,2,g)
ans =
  -1.9266e-11  -1.8945e-11
>>
```

Note that the change in gravitational potential energy is small, as the timestep `dt` that was used to create `traj` is small. It is logical that such a system would experience minimal change over a very short timeframe.

For an additional example of this function running, please see `demo_3_bodies.m`, which shows gravitational potential energy being plotted as a function of time.

## Theory

As mentioned previously, gravitational potential energy is defined by the following formula:

```math
GPE = -gm_1m_2/r
```

Given the postitions and masses of many bodies at a given state in time, the gravitational potential of a single body is equal to the gravitational energy between that  body and all of the other individual bodies. 

The algorithm finds every unique pair, and sums up the gravitational potential between them to come up with a single gravitational potential for each planet. The sum of the potential of all of the planets is the gravitational potential energy of the system at that time.
