n=500;
I=zeros(n,n);
%I=imread('cat.jpg');
colormap(gray);
dims = size(I);
xlen = dims(1);
ylen = dims(2);
for x=1:xlen
    for y=1:ylen
        if mod(x,100) == 0
            I(x,y)=1;
        end
        if mod(y,200) == 0
            I(x,y)=1;
        end
        if x==y
            I(x,y)=1;
        end
        if x==500-y
            I(x,y)=1;
        end
        if x==y
            I(x:x+5,y:y+5)=1;
        end
    end
end
I(1:30,1:50)=1;
imshow(I);
