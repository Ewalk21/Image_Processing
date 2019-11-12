function e = Expect(I)
I=imread('cat.jpg');
I=double(I);
colormap(gray);
H = zeros(1,max(size(I)));
isum = sum(sum(I));
N = max(size(I))*min(size(I));
AOD = isum/N;
AOD = mean(mean(I));
for i=1:255
   H(i) = i*length(find(I==i))/N;
end
disp(sum(H));
disp(AOD);
e=sum(H);
end