function [X,Y,Z] = modplot(Cplane)
dims = size(Cplane);
xlen = dims(1);
ylen = dims(2);
Z = zeros(xlen,ylen);
Z2 = zeros(xlen,ylen);
for i=1:xlen
   for j=1:ylen
       Z(i,j) = sqrt(real(Cplane(i,j))^2+imag(Cplane(i,j))^2);
   end
end
figure
surf(real(Cplane),imag(Cplane),Z,'FaceAlpha',0.7)
hold on
surf(real(Cplane),imag(Cplane),Z2,'FaceAlpha',0.7)
%axis([-4 4 -4 4 -4 4])
axis equal
end