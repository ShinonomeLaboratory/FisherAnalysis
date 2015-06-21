# FisherAnalysis

Fisher Analysis in Matlab

#Quick start

If we have a data matrix and a label vector, we can start now!

Considering if we have a data matrix constructed with 4-D vectors:

X=[1,0,1,1;2,0,1,3,;.....;1,0,1,3];

... and a label vector divided then in 2 classes:

y=[1,0,1,1,0,...,1]';

it also can be multi-class:

y=[1,3,4,2,3,5,3,5,1,2,4,3,...]';

we can use this [W] = libFisher(y,X,2,1);

to get the W to transfer X into 2-D vectors:X2=X*W;

Have fun!
