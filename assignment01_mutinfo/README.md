# Assignment #1

## mut_info1.m

> 	mut_info1 (P,Px)
    
> This is a Matlab/ __Octave__ function that, given the transition matrix P and the probability vector for the input symbols Px, returns the mutual information I(X;Y)

## BSC.m

> A test that shows the mutual information for a Binary Symmetric Channel (BSC) with different sets of P and Px.

>		+---+------+------+
>		| P | y1   | y2   |
>		+---+------+------+
>		| x1| 1-p  |  p   |
>		+---+------+------+
>		| x2|  p   | 1-p  |
>		+---+------+------+

## BSC.jpg

> A 3D output for BSC.m
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/BSC.jpg)

> Thus, the channel capacity is
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/C_BSC.jpg)

## Dual_BSC

> A test that shows the mutual information for two BSC channels in series with different sets of P and Px.

>		+---+-----------+-----------+
>		| P |    y1     |    y2     |
>		+---+-----------+-----------+
>		| x1| 1-2p(1-p) | -2p(1-p)  |
>		+---+------+----------------+
>		| x2| -2p(1-p)  | 1-2p(1-p) |
>		+---+------+----------------+

## Dual_BSC.jpg

> A 3D output for Dual_BSC.m
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/Dual_BSC.jpg)

> Thus, the channel capacity is
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/C_Dual_BSC.jpg)

## BEC

> A test that shows the mutual information for a Binary Erasure Channel (BEC) with different sets of P and Px.

>		+---+------+------+------+
>		| P |  y1  |  y2  |  y3  |
>		+---+------+------+------+
>		| x1|  1-p |  p   |  0   |
>		+---+------+------+------+
>		| x2|  0   |  p   | 1-p  |
>		+---+------+------+------+

## BEC.jpg

> A 3D output for BEC.m
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/BEC.jpg)

> Thus, the channel capacity is
![BSC.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment01_mutinfo/C_BEC.jpg)