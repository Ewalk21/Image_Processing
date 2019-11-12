%{
Exercise 1c)
Obtain the image "spot.jpg". This is a 256 × 256 gray scale image 
with 8-bit pixels. Plot a histogram for the image. Write a program to 
perform a full-scale contrast stretch on the image. Display the 
enhanced image and plot its histogram.
%}


I=imread('spot.jpg');
%I=rgb2gray(I);
I=double(I);
colormap(gray);

isum = sum(sum(I));
AOD = isum/(255*255);

a=0;
b=AOD;
O = (255/(b-a))*(I-a);

subplot(2,2,1),imagesc(I,[0,255]);
subplot(2,2,3),hist(I);
subplot(2,2,2),imagesc(O,[0,255]);
subplot(2,2,4),hist(O);