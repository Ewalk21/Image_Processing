%{
Asignment5_1
Denoise the image “Camblurred.jpg” using 2D Fourier analysis.
%}

I=imread('Camblurred.jpg');
I = rgb2gray(I);
I=im2double(I);
[m,n]=size(I);

f=fftshift(fft2(I));
f1=log(1+abs(f));


g=f;

g(98:109,143:149)=0;
g(195:205,145:155)=0;
g(220:240,255:270)=0;
g(95:108,300:320)=0;
g(125:150,170:180)=0;
g(220:240,90:110)=0;
g(125:145,250:270)=0;
g(190:210,225:245)=0;
g(250:270,280:300)=0;
g(65:90,110:120)=0;
g(140:345,150:160)=0;
g(194:200,1:345)=0;
g(100:108,1:345)=0;
g(130:138,1:345)=0;


B=abs((ifft2(g)));

colormap(gray)
subplot(2,2,1),imagesc(I)
subplot(2,2,2),imagesc(f1)
subplot(2,2,3),imagesc(B)
subplot(2,2,4),imagesc(log(1+abs(g)))