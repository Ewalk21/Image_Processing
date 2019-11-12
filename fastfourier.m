t=0:.001:.6;

x=sin(2*pi*100*t)+cos(2*pi*130*t);

%for noise
y=x+2*randn(size(t));

Y=fft(y,512);
size(Y)
size(t)

Pyy=Y.*conj(Y)/512;
f=1000*(0:256)/512;


subplot(3,1,1),plot(x);

subplot(3,1,2),plot(y);

subplot(3,1,3),plot(f,Pyy(1:257));
