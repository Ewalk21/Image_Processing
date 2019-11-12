
%{ 
Exercise 2_1
The fading of images is a special effect that is used daily in motion
features and big screen movies.  The fading of one image to another is
implemented simply using a pixel by pixel comparison of the two original images.
Write a Matlab program that implements the fading algorithm from an initial image
to a destination image. Use the Matlab function ‘drawnow’ to display the intermediate images of the fade.  
%}

I=imread('flowers.jpg');
colormap(gray);

J=imread('cameraman.jpg');
colormap(gray);
d=size(I);
Inter = zeros(d(1),d(2));

%N=input('enter N   ');
N = 200;
for n=1:N
    for i=1:d(1)
        for j=1:d(2)
            Inter(i,j)= I(i,j) - (n/N)*I(i,j) + (n/N)*J(i,j);
        end
    end
    drawnow
    %pause(.1)
    imagesc(Inter);
end

%for reversing the fade, untag
%{
for n=1:N
    for i=1:255
        for j=1:255
            Inter(i,j)= J(i,j) - (n/N)*J(i,j) + (n/N)*I(i,j);
        end
    end
    drawnow
    pause(.1)
    imagesc(Inter);
end
%}
