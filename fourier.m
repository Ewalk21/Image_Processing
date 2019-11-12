N=200  %input('enter N   ');
t=0:0.0001:6*pi;
W=0;
for i=1:2:N
    W=W+(4/(pi)).*sin(t*i);  %Sum is W, bn =
    drawnow
    pause(.3)
    plot(t,W)
    %axis tight
end