function [X,Y,Z] = RiemannSphere(Cplane,n)
dims = size(Cplane);
xlen = dims(1);
ylen = dims(2);
Z = zeros(xlen,ylen);
%Z2 = zeros(xlen,ylen);
X = zeros(xlen,ylen);
Y = zeros(xlen,ylen);
for i=1:xlen
   for j=1:ylen
       Clen = real(Cplane(i,j))^2+imag(Cplane(i,j))^2;
       m = (Clen+1)/2;
       Z(i,j) = 1-(1/m);
       X(i,j) = real(Cplane(i,j))/m;
       Y(i,j) = imag(Cplane(i,j))/m;
   end
end
%{
mysphere(50);
hold on
surf(X,Y,Z,'FaceAlpha',0.6,'FaceColor','interp')
axis equal
if(n==1)
    surf(real(Cplane),imag(Cplane),Z2,'FaceAlpha',0.4)
    axis([-4 4 -4 4 -4 4])
end
%}
end
