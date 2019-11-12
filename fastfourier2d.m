I=imread('cameraman.jpg');

f=fftshift(fft2(I));
f1=log(1+abs(f));
colormap(gray);

g=f;
%mask g in bright spots
g(120:140,110:130)=0;
gl=log(1+abs(g));

B=abs((ifft2(g)));

%imagesc(I);
subplot(2,2,1), imagesc(I);
subplot(2,2,2), imagesc(f1);
subplot(2,2,3), imagesc(B);
subplot(2,2,4), imagesc(gl);