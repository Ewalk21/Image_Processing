I=imread('saltpeppcamera.jpg');

I=rgb2gray(I);
imshow(I);

filt = (1/9)*ones(3,3);
harmfilt = 9*ones(3,3);

K=medfilt2(I);
K=medfilt2(K);
K=medfilt2(K);
L=imfilter(I,filt,'replicate');


subplot(1,2,1), imshow(I)
subplot(1,2,2), imshow(K)
%subplot(2,2,3), imshow(L)