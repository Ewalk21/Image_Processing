function C = ComplexifyImage(I)
dims = size(I);
xlen = dims(1);
ylen = dims(2);


xscaler = .1*xlen;
yscaler = .1*ylen;

x = -(xlen-1)/2:1:(xlen-1)/2;
y = -(ylen-1)/2:1:(ylen-1)/2;
C = zeros(xlen,ylen);
for i=1:xlen
   for j=1:ylen
       C(i,j)= complex(y(j)/yscaler,-x(i)/xscaler);
   end
end
%C=C*1j;
end
