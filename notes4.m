clear
I=imread('cameraman.jpg');
I=double(I);
colormap(gray);

dy=[-1,0,1;
    -1,0,1;
    -1,0,1];
dx=[-1,-1,-1;
    0,0,0;
    1,1,1];


subplot(1,3,1),imagesc(I,[0,255]);
subplot(1,3,2),edge(I,'prewitt');
subplot(1,3,3),edge(I,'canny',.1);

%type help edge in command window to see how to use, to edit, type edit
%edge