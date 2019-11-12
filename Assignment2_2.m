%{
Exercise 2_2
Write a program to find instances of your template in the image using the Binary
Template Matching algorithm discussed in class. You will have to design the 
template yourself based on an analysis of the image. 
If J = MATCH(I1,I2), then M2(I1,I2) =  over all rows and columns of J.
Apply the match measure M? at every pixel in the input image where a sufficiently 
large neighborhood exists. Construct an output image J? where each pixel is 
equal to the match measure M? (set J? equal to zero at pixels where a sufficiently 
large neighborhood does not exist in the input image). 
Threshold the image J? to obtain a binary image J? that should be equal to 
logical zero at pixels where there is a high probability that your template 
is present in the input image. Display the original image, the template, J? and J?.
%}
clear

%instantiating vars
I=imread('dots.png');
%I=double(I);
I=I(1:256,1:256,:);
Orig = I;
colormap(gray);
I = rgb2gray(I);
dim=size(I);
J1=zeros(dim(1),dim(2));


%Binarizing image
I=imbinarize(I);

%creating template, dims=30x30
B = I(92:121,83:112);
dimB=size(B);
J=zeros(dimB(1),dimB(2));

%doing the dirty work
for x = dimB(1)/2:(dim(1)-dimB(1)/2)
    for y = dimB(2)/2:(dim(2)-dimB(2)/2)
        for i = 1:dimB(1)
            for j = 1:dimB(2)
                %perfoms match for every point of the template B over I
                J(i,j)=Match(B(i,j),I((x-dimB(1)/2)+i,(y-dimB(2)/2)+j));
            end
        end
        %sums all of the elements in the match matrix, max(J1(x,y))=900
        J1(x,y)=sum(sum(J));
    end
end
J1 = uint8((255/(max(max(J1)))*(J1)));
%note: max(sum(sum(J))) = 900, since dim J = 30x30
%the above code performs a linear transfromation on J1 so that the max can
%of any point in J1 is 255

%creating thresholded binary image BinJ1
J2=J1;
AODJ1=sum(sum(J1))/(dim(1)*dim(2))+65;
J2(find(J2>AODJ1)) = 255;
J2(find(J2<=AODJ1)) = 0;

subplot(2,2,1), imshow(Orig); %original picture
subplot(2,2,2), imshow(B); %the template 30x30
subplot(2,2,3), imshow(J1); %sum of the match fxn
subplot(2,2,4), imshow(J2); %binarized J1, custom threshold

%Match fxn
function M = Match(x,y)
    if x==y
        M=1;
    else
        M=0;
    end
end