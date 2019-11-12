%{
Exercise 2_3
Write a program to perform histogram equalization on images. 
Turn in your Matlab code, printouts of the original and equalized image(s), 
and histograms of the original and equalized image(s).
%}

%initializing useful variables
I=imread('cat.jpg');
I=double(I);
colormap(gray);

d=size(I);
N=d(1)*d(2);
J=zeros(d(1),d(2));
P=zeros(1,255);
Cdf=0;
%probability distribution of I
for i=1:256
    P(i) = max(size(find(I==(i-1))))/N;
end
%note, P(1) = probability of 0. there is an an offset of 1.


for i=1:d(1)
    for j=1:d(2)
        Prob = P(I(i,j)+1); %spot+1 because of the fact that P(0) is undefined, every pnt is shifted over 1
        for s = 1:(I(i,j)+1)
           Cdf = Cdf + P(s);
        end
        J(i,j)= uint8(Cdf*255+.5);
        Cdf=0;
    end
end

subplot(2,2,1),imagesc(I);
subplot(2,2,2),imagesc(J);
subplot(2,2,3),histogram(I);
subplot(2,2,4),histogram(J);
