image = imread('thay doi do sang\mui bac ho\do sang 2\gia.JPG');
image = rgb2gray(image);
% figure, imshow(image);
figure, imhist(image);
level = graythresh(image);
a = reshape(image,480*640,1);
a = double(a);
% figure, histfit(a);

pd = fitdist(a,'Normal');
pd
a = a';
% figure, histfit(a);