I = imread('cat.jpg');
disp(size(I));
for i=1:511
    for j=1:511
        I(i,j)=I(i,j) + 75*cos(((2*pi)/511)*(10*i+7*j));
    end
end

imshow(I);

