%I = checkerboard(20);
I=[1,0.5,1,0.5,1,0.5;0.5,1,0.5,1,0.5,1;1,0.5,1,0.5,1,0.5;0,1,0,1,0,1;1,0,1,0,1,0;0,1,0,1,0,1]; 
%I=imread('lines.jpg');
%I=rgb2gray(I);
%I=double(I);
dims = size(I);
xlen = dims(1)
ylen = dims(2)
vect = xlen*ylen;

%M=zeros(vect,1);
M=zeros(xlen,ylen);
J=ComplexifyImage(I);
c=1;
%{
for i=1:vect
    if (mod(vect,ylen) == 0)
        c=c+1
    end
    M(i)=[J(c,mod(vect,ylen)),I(c,mod(vect,ylen))]
    %J(x,y)=J(x,y)*1j;
    %J(x,y)=J(x,y)+y;
    %J(x,y)=(1+3*1j)*J(x,y);
end
%}
for x=1:xlen
    for y=1:ylen
        M(x,y)=[J(x,y) I(x,y)];
    end
end
%{

realLen = [min(min(real(J))), max(max(real(J)))];
imagLen = [min(min(imag(J))), max(max(imag(J)))];

realLendim = uint16(abs(realLen(1))+ abs(realLen(2)));
imagLendim = uint16(abs(imagLen(1))+ abs(imagLen(2)));

realLendim;
imagLendim;
F = zeros(realLendim,imagLendim)+20;
%F = zeros(xlen,ylen);

offset=complex(abs(realLen(1))+1,abs(imagLen(1))+1);
J=J+offset;

uint16(J);
size(F)

for i=1:xlen
    for j=1:ylen
       F(uint16(real(J(i,j))),uint16(imag(J(i,j))))= I(i,j);
    end
end
%}
colormap(gray);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imagesc(F);
%disp(I);
%disp(J);
%disp(F);
clear;