function C = Complexify(xmin,dx,xmax,ymin,dy,ymax)
x = xmin:dx:xmax;
y = ymin:dy:ymax;
xlen = max(size(x));
ylen = max(size(y));
C = zeros(xlen,ylen);
for i=1:(xlen)
   for j=1:(ylen)
      C(i,j)= complex(y(j),-x(i));
   end
end
C=C*1j;
end
