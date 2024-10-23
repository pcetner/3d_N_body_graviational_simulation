# Distance3d

Calculates the distance between two points in a 3d space.

## Syntax

`[r] = Distance3d(A,B)`

## Description

`A` and `B` are 3d points represented by `[x,y,z]`.

## Example

To find the distance between points `A` and `B`:

```matlab
>> A = [1, 2, 3]; 
>> B = [4, 5, 6];
>> distance = Distance3d(A, B);
distance = 5.1962
>>
```

The distance between points `A` and `B` is 5.1962.

## Theory

The distance between two points in 3d space is calculated using the Pythagorean theorem:

```math
d = sqrt((x_1 - x_2)^2 + (y_1 - y_2)^2 + (z_1 - z_2)^2)
```

In this function, `A` and `B` are the two points, and `x`, `y`, and `z` are the coordinates of the points. The distance between the points is calculated by taking the square root of the sum of the squares of the differences between the `x`, `y`, and `z` coordinates of the points.

This formula is implemented in the `Distance3d` function by subtracting the `x`, `y`, and `z` coordinates of point `A` from the corresponding coordinates of point `B`, and then taking the square of each of these differences. These squares are then added together and the square root of the sum is taken to obtain the distance between the two points.

This method of calculating the distance between two points in 3d space is known as the Euclidean distance, and it is a common method for finding the distance between two points in any number of dimensions.
