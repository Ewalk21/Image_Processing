%{
Exercise 1a)
The gray-level histogram is a graph of the frequency of occurrence 
of each gray level in an image I. Choose one gray-level image I. 
Write an M-file to display the histogram of I.  
Moreover, find its average optical density (AOD).
%}


I=imread('cat.jpg');
I=double(I);
colormap(gray);
H = zeros(1,255);
isum = sum(sum(I));
AOD = isum/(256*256);

for i=1:255
   H(i) = max(size(find(I==i)));
end
%disp(sum(H));
%disp(511*511);

subplot(1,3,1),histogram(I);
subplot(1,3,2),plot(H);
subplot(1,3,3),imagesc(I);