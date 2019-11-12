h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated8.gif';



I = Complexify(-5,.2,5,-5,.2,5);
dims = size(I);
xlen = dims(1);
ylen = dims(2);
Z2 = zeros(xlen,ylen);
F = ones(xlen,ylen);
M = ones(xlen,ylen);
%mysphere(50);
%syms k
for n=-30:.1:30
    for x=1:xlen
        for y=1:ylen
            %sum = exp(symsum((I(x,y)^k)/k,k,1,n));
            %F(x,y)=(1-I(x,y))*sum;
            %F(x,y)=M(x,y)*(I(x,y)-complex(n*4,n/2))/(I(x,y)-complex(n*4,-n/2));
            %F(x,y)=(I(x,y)-complex(1/n,.7))/(1-I(x,y)*complex(1/n,-.7));
            %F(x,y)= n*I(x,y)^2+complex(2*n,-1)*I(x,y);
            %F(x,y)= 1/(n*I(x,y));
            %F(x,y)= n*sin(I(x,y))+n*cos(I(x,y));
            %F(x,y)=(I(x,y)*complex(-3,1)+n*complex(-4,2))/(I(x,y)*complex(n*2,6)+complex(3,n*4));
            %F(x,y)=(I(x,y)+n*1j)/(I(x,y)*n*1j+1);
            %F(x,y)=I(x,y)*exp(n*1j);
            F(x,y) =I(x,y)*1j^n;
            
        end
    end
    %M=F;
    [X,Y,Z] = RiemannSphere(F,1);
    surf(X,Y,Z,'FaceAlpha',0.6,'FaceColor','interp')
    %axis equal
    axis([-1 1 -1 1 -1 1])
    drawnow
    pause(0.1)
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if n == -200 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    elseif n > 200
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
clear;

