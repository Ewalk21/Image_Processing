originalRGB = imread('Moon.jpg'); 
h = fspecial('motion',50,45); 
filteredRGB = imfilter(originalRGB,h); 
figure, imshow(originalRGB), figure, imshow(filteredRGB)
boundaryReplicateRGB = imfilter(originalRGB,h,'replicate'); 
figure, imshow(boundaryReplicateRGB)