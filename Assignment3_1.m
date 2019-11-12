%{
Exercise 3_1
Implement Image Erosion, Image Dilation, and from that Boundry Extraction
%}
clear

I=imread('Moon.jpg');
Original = I;
I=double(I);
colormap(gray);

isum = sum(sum(I));
AOD = isum/(512*512);


BinI=imbinarize(I,AOD); %greyscale to binary with threshold AOD
dim=size(BinI);

D=BinI;
E=BinI;
B=ones(5,5);

for x=3:(dim(1)-2)
    for y=3:(dim(2)-2)
        if BinI(x,y) == 0
            E(x-2:x+2,y-2:y+2) = 0; %image erosion
        else
            D(x-2:x+2,y-2:y+2) = 1; %image dilation
        end
    end
end

%These functions are shortcuts for future use
%K=imerode(I,B);
%J=imdilate(I, B);

%Boundary Extraction:
 Ext= BinI-E;

subplot(2,2,1), imshow(Ext); %Top Left:  Boundry extraction
subplot(2,2,2), imshow(Original); %Top Right: Original Image
subplot(2,2,3), imshow(D); %Bottom Left: Dilation
subplot(2,2,4), imshow(E); %Bottom Right: Erosion