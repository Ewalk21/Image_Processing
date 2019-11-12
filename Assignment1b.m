%{
Exercise 1b)
In the thresholded image, use a value of 255 for logical one and a value of 0 for logical zero.
There are two main regions in the input image: the imaged tissue and the dark background region
on the left side of the image. Select a threshold value so that the binary image output by your
program is equal to logical one over the background region and logical zero over the tissue.
Call this output image result1.

Write a program to implement the Approximate Contour Image Generation algorithm 
discussed in class. This program should input a binary image like result1 and output 
a binary contour image. Run the program on the image result1 produced above.
Call the output image from this program result2. Display the original image, result1, and result2.
%}

%implementing vars
I=imread('mammogram.jpg');
Original = I;
I=double(I);
colormap(gray);
dim=size(I);
J=I;

%adding zero padding around image
I=[zeros(dim(1),1),I,zeros(dim(1),1)];
I=[zeros(1,dim(2)+2);I;zeros(1,dim(2)+2)];

%thresholding image and binarizing
isum = sum(sum(I));
AOD = isum/(512*512);
I(find(I>AOD)) = 255;
I(find(I<=AOD)) = 0;


for x = 2:(dim(1)-1)
    for y = 2:(dim(2)-1)
        if I(x,y)==0
            J(x,y)=255;
        elseif (sum(sum(I(x-1:x+1,y-1:y+1)))-I(x,y)) <= 255*7
            J(x-1:x+1,y-1:y+1)=0;
        elseif (sum(sum(I(x-1:x+1,y-1:y+1)))-I(x,y)) <= 255
            J(x-1:x+1,y-1:y+1)=255;
        end
    end
end

subplot(1,3,1),imshow(Original); %original image
subplot(1,3,2),imshow(I); %thresholded image, 0=0, 1=255
subplot(1,3,3),imshow(J); %contour image

%there are borders of either black or white on I and J. this is due too a
%fine 2-3 pixel thick grey border on the original mammogram image, if run,
%know its not the code thats messing up.
