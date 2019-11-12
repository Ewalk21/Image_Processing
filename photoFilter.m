parts = input('Enter how many levels per channel:');
I=imread('19540031.jpg');

bool = 1;
[r,c,~] = size(I);
stepleft = 0;
stepright = 255/parts;
dx=stepright;
R=zeros(r,c);
G=zeros(r,c);
B=zeros(r,c);

if(bool == 0)
    for i=1:parts
        if (mod(i,2) == 0)
           R(I(:,:,1) >= stepleft & I(:,:,1) <= stepright) = 0;
           G(I(:,:,2) >= stepleft & I(:,:,2) <= stepright) = 0;
           B(I(:,:,3) >= stepleft & I(:,:,3) <= stepright) = 0;
        else
           R(I(:,:,1) >= stepleft & I(:,:,1) <= stepright) = 180;
           G(I(:,:,2) >= stepleft & I(:,:,2) <= stepright) = 180;
           B(I(:,:,3) >= stepleft & I(:,:,3) <= stepright) = 180;
        end
        stepleft = stepleft + dx;
        stepright = stepright + dx;
    end
else
    for i=1:parts
        R(I(:,:,1) >= stepleft & I(:,:,1) <= stepright) = mean(I(I(:,:,1) >= stepleft & I(:,:,1) <= stepright));
        G(I(:,:,2) >= stepleft & I(:,:,2) <= stepright) = mean(I(I(:,:,2) >= stepleft & I(:,:,2) <= stepright));
        B(I(:,:,3) >= stepleft & I(:,:,3) <= stepright) = mean(I(I(:,:,2) >= stepleft & I(:,:,3) <= stepright));
        stepleft = stepleft + dx;
        stepright = stepright + dx;
    end
    r = sum(sum(R))/(r*c);
    g = sum(sum(G))/(r*c);
    b = sum(sum(B))/(r*c);
    a=125; %larger a, darker image

    R = (255/(r-a))*(R-a);
    G = (255/(g-a))*(G-a);
    B = (255/(b-a))*(B-a);
end

RGB=cat(3,R,G,B);
%RGB=rgb2gray(RGB);
imshow(RGB);
imwrite(RGB,'markspark.png');
