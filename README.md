# `Gravitating Bodies`

A project exploring gravitational body simulation of n-number of bodies in three dimensions, accomplished via the Euler method. 

## Description

The Euler method is a numerical technique used to approximate the behavior of a physical system over time. Over a given space, the main characteristics of the bodies found within that space are mass, position, and velocity. Given the initial state of a system, as well as a timestep, the Euler method can be used to approximate the next states of the system. This is accomplished by using the law of universal gravitation, which dictates that the gravitational force between two bodies is proportional to the product of their masses and inversely proportional to the square of the distance between them. Visualization techniques, such as plotting the positions of the bodies in three-dimensional space over time, can then allow the user to observe the motion of the bodies in the simulation.

## Examples

Given the 3 bodies described below, a simulation timestep of .04, and 2250 steps to simulate, the following graphs are produced by `demo_3_bodies.m`.

```matlab
 p1.m = 10^10;
 p1.pos = [1 1 1];
 p1.vel = [0 .4 .01];

 p2.m = 10^10;
 p2.pos = [1 3 -4];
 p2.vel = [-.2 -.6 -.01];

 p3 = p1;
 p3.pos = [-1,-1,3];
 p3.vel = [0 -.2 0.01];
```

![A demo of three bodies.](project2/demo_3_bodies_PHOTO.PNG)

Note how the 2 corresponding drops in total energy occour when the two bodies are very close to each other. This occours because the Euler method assumes that across a small timestep, acceleration can be seen as constant. The faster objects are accelerating over the given timestep, the worse the assumption that acceleration can be seen as constant becomes.

Below is an example of how decreasing the timestep of an Euler simulation can improve its accuracy.  The simulation uses the same initial state as above. The light blue line represents a very small timestep, and the orange line represents a larger timestep. Note that as the timestep decreases, the total energy of the system changes less. In the real world, there is negligible energy loss from planets moving throughout empty space. The below figure shows that as the timestep approaches zero, the accuracy of the simulation improves.

![A demo of total energy changing less as the timestep decreases.](project2/demo_totalE_changing_PHOTO.PNG)

## Theory

By assuming acceleration is constant given a small enough timestep, the Euler method allows us to simulate the behavior of bodies through time with kinematics. 

Using this method, all we need to know to simulate our system is the sum of the forces acting on a body at any given time. In this case, the only force acting upon each body is gravity, which is represented by the equation:

```math
F_g = G  \frac{m_1m_2}{r^2}
```

Since each body exerts a different force on each of the other bodies, the sum of the forces on a given body `B1` in a situation of `n` bodies can be given by:

```math
G \cdot m_{B1} \sum_{}^{} \frac{m_{B2}}{{r_{B1:B2}}^2} + \frac{m_{B2}}{{r_{B1:B2}}^2} +\frac{m_{B3}}{{r_{B1:B3}}^2} +   ... + \frac{m_{Bn}}{{r_{B1:Bn}}^2}
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

## Basic/Proficient/Advanced

I believe my project would fall under proficient. It can simulate n-number of bodies in three dimensions, and only one of those is required to acheive proficient. Additionally, my project includes some distinctive graphs, such as position versus time in 3D space and energy (kinetic and potential) over time. It also demonstrates how adjusting the timestep improves the accuracy of the simulation. These graphs provide valuable insights into the movements and interactions of the simulated bodies.
