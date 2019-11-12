%{
%Assignment5_2
Using Fourier analysis, identify the corresponding dialed numbers from
touchtone.wav
%}
%[ttone,FS,bits]
[y,fs]=audioread('touchtone.wav');
%sound(y,fs)
d=size(y);

y1=y(1:1236);
y2=y(1640:2869);
y3=y(3266:4508);
y4=y(4918:6158);
y5=y(6553:7786);
y6=y(8196:9436);
y7=y(9830:11063);

f1=fft(y1,512);
f2=fft(y2,512);
f3=fft(y3,512);
f4=fft(y4,512);
f5=fft(y5,512);
f6=fft(y6,512);
f7=fft(y7,512);

Pf1=f1.*conj(f1)/512;
Pf2=f2.*conj(f2)/512;
Pf3=f3.*conj(f3)/512;
Pf4=f4.*conj(f4)/512;
Pf5=f5.*conj(f5)/512;
Pf6=f6.*conj(f6)/512;
Pf7=f7.*conj(f7)/512;


t=fs*(0:256)/512;
size(f7)
size(t)
size(Pf1)

subplot(2,4,1), plot(y);
subplot(2,4,2), plot(t,Pf1(1:257));
subplot(2,4,3), plot(t,Pf2(1:257));
subplot(2,4,4), plot(t,Pf3(1:257));
subplot(2,4,5), plot(t,Pf4(1:257));
subplot(2,4,6), plot(t,Pf5(1:257));
subplot(2,4,7), plot(t,Pf6(1:257));
subplot(2,4,8), plot(t,Pf7(1:257));

%{
y1 = 3
y2 = 2
y3 = 8
y4 = 8
y5 = 0
y6 = 7
y7 = 6
%}
