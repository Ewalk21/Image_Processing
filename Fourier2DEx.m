f=zeros(30,30);
f(5:24,13:17)=1;

f1=fft2(f,256,256);
f2=fftshift(f1);

g=50*ones(30);
g1=fft2(g);
g2=fftshift(g1);

h=f;
for i=1:30
    for j=1:30
        h(i,j)=6*cos(((2*pi)/30)*(10*i+7*j));
        
    end
end

h1=fft2(h);
h2=fftshift(h1);


colormap(gray)
subplot(4,2,1),imagesc(g)
subplot(4,2,2),imagesc(log(1+abs(g2)))
subplot(4,2,3),imagesc(h)
subplot(4,2,4),imagesc(log(1+abs(h2)))
subplot(4,2,5),imagesc(f)
subplot(4,2,6),imagesc(log(1+abs(f2)))
subplot(4,2,7),mesh(abs(f2))
