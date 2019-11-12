%{
Assignment 4_2
This exercise deals with the use of two-dimensional, second-order derivatives 
for image enhancement. The approach basically consists of defining a discrete 
formulation of the second-order derivative and then constructing a filter mask 
based on that formulation. We are interested in isotropic filters, whose response 
is independent of the direction of the discontinuities in the image to which the 
filter is applied. The simplest isotropic derivative operator is the Laplacian 
defined in exercise 1. In order to be useful for DIP, the equation (?) needs to 
be expressed in discrete form.
%}
clear
I=imread('Moon.jpg');
colormap(gray);

mask1 = [1,1,1;
        1,-8,1;
        1,1,1];

mask2 = [0,1,0;
        1,-4,1;
        0,1,0];

filt=imfilter(I,mask1,'replicate');
%filt2=imfilter(I,mask2,'replicate');

M=I-filt;
%M2=I-filt2;

filt2=imfilter(M,mask1,'replicate');
M2=M-filt2;

subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(M);
subplot(1,3,3), imshow(M2);