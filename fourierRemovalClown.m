A=imread('clown.jpg');
A=double(A);
[m,n]=size(A);

f=fftshift(fft2(A));
f1=log(1+abs(f));
colormap(gray)

g=f;
g(49:56,35:51)=0;
g(75:110,10:36)=0;
g(23:50,100:120)=0;
g(73:82,80:95)=0;

B=abs((ifft2(g)));


subplot(3,2,1),imagesc(A)
subplot(3,2,2),imagesc(f1)
subplot(3,2,3),imagesc(log(1+abs(g)))
subplot(3,2,4),imagesc(B)