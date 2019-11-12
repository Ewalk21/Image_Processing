parts = input('Enter how many levels per channel:');
I=imread('army1.png');

%I=double(I);

colormap(gray);  %imshow wrks too
%I=rgb2gray(I);

bool = 0;
stepleft = 0;
stepright = 255/parts;
dx=stepright;
C=I;

if (bool == 0)
    for i=1:parts
        if (mod(i,2) == 1)
           C(I >= stepleft & I <= stepright) = 0;
        else
           C(I >= stepleft & I <= stepright) = 255;
        end
        stepleft = stepleft + dx;
        stepright = stepright + dx;
    end
else
    for i=1:parts
        C(I >= stepleft & I <= stepright) = mean(I(I >= stepleft & I <= stepright));
        stepleft = stepleft + dx;
        stepright = stepright + dx;
    end
end

colormap(gray);  %imshow wrks too
imshow(C);
imwrite(C,'army1.png');



