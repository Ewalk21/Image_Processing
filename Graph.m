function [R,I] = Graph(C)
dims = size(C);
xlen = dims(1);
ylen = dims(2);
I = zeros(xlen,ylen);
R = zeros(xlen,ylen);
for i=1:xlen
   for j=1:ylen
       R(i,j)= real(C(i,j));
       I(i,j)= imag(C(i,j));
   end
end
plot(real(C),imag(C),'-');
end