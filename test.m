fprintf('Transfromation selection (n): \n n = 0: identity \n');
fprintf(' n = 1: Quadratic \n n = 2: Eschers transform \n');
fprintf(' n = 3: Mobius \n n = 4: e^z \n');
fprintf(' n = 5: log(z) \n n = 6: z^2 \n');
fprintf(' n = 7: z^i \n n = 8: sin(z)+cos(z) \n');
n = input('enter n:   ');
fprintf('Selection for displaying the Complex plane with the Riemann sphere (a): \n');
fprintf('a = 0 = no   ,   a = 1 = yes \n');
a = input('enter a:   ');

%M = zeros(400,400);
%J = ComplexifyImage(M);
I = Complexify(-5,.2,5,-5,.2,5);

%J = complexFunc(J,n);
I=complexFunc(I,n);

%modplot(I);
%Graph(I);
dims = size(I);
xlen = dims(1);
ylen = dims(2);
%RiemannSphere(J,a);

%for sphere

[X,Y,Z]=RiemannSphere(I,a);
Z2 = zeros(xlen,ylen);
mysphere(50);
hold on
surf(X,Y,Z,'FaceAlpha',0.6,'FaceColor','interp')
axis equal
if(a==1)
    surf(real(I),imag(I),Z2,'FaceAlpha',0.4)
    axis([-4 4 -4 4 -4 4])
end

clear;