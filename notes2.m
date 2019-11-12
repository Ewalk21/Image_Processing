I=imread('spot.jpg');
I=double(I);
%colormap(gray);  %imshow wrks too
%imagesc(I);  %sc meeans scale 
B = I;
%B = I>155;
%a = min(min(I));
%b = max(max(I));
for i=1:255
    find(I==i);
end
colormap(gray);  %imshow wrks too
subplot(1,2,1),imagesc(I,[0,255]);
subplot(1,2,2),imagesc(B,[0,255]);
%hist(I);