I = Complexify(-5,.2,5,-5,.2,5);
dims = size(I);
xlen = dims(1);
ylen = dims(2);
F = zeros(xlen,ylen);
for n=-30:30
    for x=1:xlen
        for y=1:ylen
            %F(x,y)= n*I(x,y)^2+complex(2*n,-1)*I(x,y)-complex(n,-2);
            %F(x,y)= n/(I(x,y))-complex(n,1/n);
            %F(x,y)= n*sin(I(x,y))+n*cos(I(x,y));
            F(x,y)=(I(x,y)*complex(-13,-10)+complex(-9*n,-6))/(I(x,y)*complex(5,6)+complex(n*3,n*4));
            %F(x,y)=I(x,y)*exp(n*1j);
        end
    end
    [X,Y] = Graph(F);
    plot(X,Y)
    axis([-6 6 -6 6])
    drawnow
    pause(0.1)    
end
clear;