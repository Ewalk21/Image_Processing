function F = complexFunc(C,n)
dims = size(C);
xlen = dims(1);
ylen = dims(2);
F = zeros(xlen,ylen);
if(n==1)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=C(x,y)^3-1;
        end
    end
elseif(n==2)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=C(x,y)^((2*pi*1i+log(256))/(2*pi*1i));
        end
    end
elseif(n==3)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=(C(x,y)*complex(-13,-10)+complex(-9,-6))/(C(x,y)*complex(5,6)+complex(8,10));
        end
    end
elseif(n==4)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=exp(C(x,y));
        end
    end
elseif(n==5)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=log(C(x,y));
        end
    end
elseif(n==6)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=C(x,y)^2;
        end
    end
elseif(n==7)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=C(x,y)^1i;
        end
    end
elseif(n==8)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=sin(C(x,y))+cos(C(x,y));
        end
    end
elseif(n==9)
    for x=1:xlen
        for y=1:ylen
            F(x,y)=(C(x,y)-complex(3,7))/(1-C(x,y)*complex(3,-7));
        end
    end
else
    F=C;
end
end