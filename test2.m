%I = checkerboard(20);
%I=[1,0.5,1,0.5,1,0.5;1,0.5,1,0.5,1,0.5;0.5,1,0.5,1,0.5,1;1,0.5,1,0.5,1,0.5;0,1,0,1,0,1;1,0,1,0,1,0;0,1,0,1,0,1]; 
I=imread('grid1.png');
%I=rgb2gray(I);
%I=double(I);

dims = size(I);
xlen = dims(1);
ylen = dims(2);

zi = [766j, 512+766j, 256+192j];
wi = [738j, 512+496j, 256+173j];

F=zeros(xlen,ylen);
C=ComplexifyImage(I);
for x=1:xlen
    for y=1:ylen
        %qf = ((wi(1) * (-wi(2) * (zi(1)-zi(2)) * (J(x,y)-zi(3)) + wi(3) * (J(x,y)-zi(2)) * (zi(1)-zi(3))) - wi(2)*wi(3)*(J(x,y)-zi(1)) * (zi(2)-zi(3))));
        %qs = (wi(3)*(zi(1)-zi(2))*(J(x,y)-zi(3))-wi(2)*(J(x,y)-zi(2))*(zi(1)-zi(3))+wi(1)*(J(x,y)-zi(1))*(zi(2)-zi(3)));
        %F(x,y) = qf/qs;
        %F(x,y)=C(x,y)*1j;
        %F(x,y)=C(x,y)+y;
        %F(x,y)=20*((C(x,y)+1j)/(C(x,y)+1));
        %F(x,y)=20*(C(x,y))/(C(x,y)+6*1j);
        %F(x,y)=20*exp(C(x,y));
        %F(x,y)=cos(C(x,y))+sin(C(x,y));
        F(x,y)=(C(x,y)^2)*10;
        %F(x,y)=(C(x,y)^4);
        %F(x,y)=(((1-1j)*C(x,y)+2*1j)/((1+1j)*C(x,y)+2))*20;
        %F(x,y)=(C(x,y)*1j)^((2*pi*1i+log(256))/(2*pi*1i));
        %F(x,y)=(2+3*1j)*C(x,y);
        %F(x,y)=10/C(x,y);
    end
end


realLen = [min(min(real(F))), max(max(real(F)))];
imagLen = [min(min(imag(F))), max(max(imag(F)))];

realLendim = uint16(abs(realLen(1))+ abs(realLen(2)));
imagLendim = uint16(abs(imagLen(1))+ abs(imagLen(2)));

realLendim;
imagLendim;
J = zeros(realLendim,imagLendim)+30;

offset=complex(abs(realLen(1))+1,abs(imagLen(1))+1);
F=F+offset;

uint16(J);
size(J)

for i=1:xlen
    for j=1:ylen
       J(uint16(real(F(i,j))),uint16(imag(F(i,j))))= I(i,j);
    end
end

colormap(gray);
subplot(1,2,1),imagesc(I);
subplot(1,2,2),imagesc(J);
clear;


