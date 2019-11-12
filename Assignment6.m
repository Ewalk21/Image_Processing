%{
Assignment6
Use Singular Value Decomposition method (SVD) to compress data so that the 
original image could be reconstructed (compressed) with much less data.
%}
L1=imread('cameraman.jpg');
L1=double(L1);

L2=rand(256);

[U,S,V]=svd(L1);
[U2,S2,V2]=svd(L2);
D=S(find(S));       %The finf function finds the indices of nonzero values
D2=S2(find(S2));

Fnorm1 = sqrt(sum(sum(L1.^2)))
Fnorm2 = sqrt(sum(sum(L2.^2)))

R1=L1;
R2=L1;
R3=L1;
R4=L1;
R5=L1;
R6=L1;
R7=L1;
R8=L1;
M1=L1;
M2=L1;
M3=L1;
M4=L1;
M5=L1;
M6=L1;
M7=L1;
M8=L1;
E1=zeros(1,8);
E2=zeros(1,8);
s=0;
s2=0;
for i=1:256
    s=s+D(i)*U(:,i)*transpose(V(:,i));
    s2=s2+D2(i)*U2(:,i)*transpose(V2(:,i));
    if(i==1)
       R1=s;
       M1=s2;
       E1(1)= sqrt(sum(sum((L1-R1).^2)))/Fnorm1;
       E2(1)= sqrt(sum(sum((L2-M1).^2)))/Fnorm2;
    elseif(i==2)
       R2=s;
       M2=s2;
       E1(2)= sqrt(sum(sum((L1-R2).^2)))/Fnorm1;
       E2(2)= sqrt(sum(sum((L2-M2).^2)))/Fnorm2;
    elseif(i==4)
       R3=s;
       M3=s2;
       E1(3)= sqrt(sum(sum((L1-R3).^2)))/Fnorm1;
       E2(3)= sqrt(sum(sum((L2-M3).^2)))/Fnorm2;
    elseif(i==8)
       R4=s;
       M4=s2;
       E1(4)= sqrt(sum(sum((L1-R4).^2)))/Fnorm1;
       E2(4)= sqrt(sum(sum((L2-M4).^2)))/Fnorm2;
    elseif(i==16)
       R5=s;
       M5=s2;
       E1(5)= sqrt(sum(sum((L1-R5).^2)))/Fnorm1;
       E2(5)= sqrt(sum(sum((L2-M5).^2)))/Fnorm2;
    elseif(i==32)
       R6=s;
       M6=s2;
       E1(6)= sqrt(sum(sum((L1-R6).^2)))/Fnorm1;
       E2(6)= sqrt(sum(sum((L2-M6).^2)))/Fnorm2;
    elseif(i==64)
       R7=s;
       M7=s2;
       E1(7)= sqrt(sum(sum((L1-R7).^2)))/Fnorm1;
       E2(7)= sqrt(sum(sum((L2-M7).^2)))/Fnorm2;
    elseif(i==128)
       R8=s;
       M8=s2;
       E1(8)= sqrt(sum(sum((L1-R8).^2)))/Fnorm1;
       E2(8)= sqrt(sum(sum((L2-M8).^2)))/Fnorm2;
    end
end

x=1:256;
colormap(gray);

subplot(8,2,1), imagesc(R1);
subplot(8,2,3), imagesc(R2);
subplot(8,2,5), imagesc(R3);
subplot(8,2,7), imagesc(R4);
subplot(8,2,9), imagesc(R5);
subplot(8,2,11), imagesc(R6);
subplot(8,2,13), imagesc(R7);
subplot(8,2,15), imagesc(R8);
%subplot(9,2,17), plot(x,D);
subplot(8,2,2), imagesc(M1);
subplot(8,2,4), imagesc(M2);
subplot(8,2,6), imagesc(M3);
subplot(8,2,8), imagesc(M4);
subplot(8,2,10), imagesc(M5);
subplot(8,2,12), imagesc(M6);
subplot(8,2,14), imagesc(M7);
subplot(8,2,16), imagesc(M8);
%subplot(9,2,18), plot(x,D2);

%subplot(1,2,1), plot(x,D);
%subplot(1,2,2), plot(x,D2);

disp(E1);
%[0.3594, 0.2911, 0.2258, 0.1771, 0.1299, 0.0854, 0.0465, 0.0143]
disp(E2);
%[0.4978, 0.4940, 0.4866, 0.4724, 0.4455, 0.3955, 0.3072, 0.1638]

clear;
    
    
    
    
    
    
    