# `NEXT`

A gravitational bodies simulation can approximate the next positions of bodies given an initial state and a small step forward in time.

## Syntax

```matlab
[nextstate] = next(init,dt,g)
```

## Description

Given the input struct of `init`, which is composed of numerous structs defining various bodies, as well as a current time `T`, a the next state of the system can be approximated`dt` seconds into the future, with a gravitational constant of `g`. Each body inside `init` is a struct composed of various information about the given body, such as mass, a position array ([x, y, z]), and a velocity array ([x, y, z]). An example init struct is shown below:

```matlab
init =

scalar structure containing the fields:
    t = 0
    p1 =
      scalar structure containing the fields:
        m = 1.0000e+08
        pos =
            1   1   1
        vel =
            0   0   0
    p2 =
      scalar structure containing the fields:
        m = 1.0000e+08
        pos =
            -1  -1  -1
        vel =
            0   0   0
```

## Examples

Using the above struct, a timestep of .01 and .2, and g being the gravitational constant:

```matlab
>> next(init,.1,g)
ans =
  scalar structure containing the fields:
    t = 0.1000
     p1 =
      scalar structure containing the fields:
        m = 1.0000e+08
        pos =
           1.0000   1.0000   1.0000
        vel =
          -3.2111e-05  -3.2111e-05  -3.2111e-05
    p2 =
      scalar structure containing the fields:
        m = 1.0000e+08
        pos =
          -1.0000  -1.0000  -1.0000
        vel =
           3.2111e-05   3.2111e-05   3.2111e-05
>>
>> next(init,.2,g)   
  ans =
      scalar structure containing the fields:
        t = 0.2000
        p1 =
          scalar structure containing the fields:
            m = 1.0000e+08
            pos =
               1.0000   1.0000   1.0000
            vel =
              -6.4221e-05  -6.4221e-05  -6.4221e-05
        p2 =
          scalar structure containing the fields:
            m = 1.0000e+08
            pos =
              -1.0000  -1.0000  -1.0000
            vel =
               6.4221e-05   6.4221e-05   6.4221e-05
>>
```

## Theory

By assuming acceleration is constant given a small enough timestep, the Euler method allows us to simulate the behavior of bodies through time with kinematics. 

Using this method, all we need to know to simulate our system is the sum of the forces acting on a body at any given time. In this case, the only force acting upon each body is gravity, which is represented by the equation:

```math
\vec{F_g} = -G  \frac{m_1m_2}{r^2} \hat{r}
```

Since each body exerts a different force on each of the other bodies, the sum of the forces on a given body `B1` in a situation of `n` bodies can be given by:

```math
G \cdot m_{B1} \sum_{}^{} \frac{m_{B2}}{{r_{(B1:B2)}}^2}\hat{r}_{(B1:B2)} + \frac{m_{B3}}{{r_{(B1:B3)}}^2}\hat{r}_{(B1:B3)} +\frac{m_{B4}}{{r_{(B1:B4)}}^2}\hat{r}_{(B1:B4)} +   ... + \frac{m_{Bn}}{{r_{(B1:Bn)}}^2}\hat{r}_{(B1:Bn)}
```

We then calculate the changes due to the acceleration with the equation:

```math
\frac{d^2 \vec{x}}{dt^2} = \vec{F}(t,\vec{x},\ldots) / m(t,\vec{x},\ldots)
```

From here, we can calculate the next state of the body using the equations:

```math
\vec{x}_2 = \vec{x}_1 + v_1\cdot\Delta t + \frac{1}{2}a\cdot\left(\Delta t\right)^2
```

```math
\vec{v}_2 = \vec{v}_1 + \vec{a} \cdot \Delta t\\
```

An example test, `GRAVITATING_BODIES_test_next_states_simple.m` tests the initial state posed above, and verifies that the velocities of the two bodies point towards each other.
