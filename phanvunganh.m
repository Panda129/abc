
clear;
image = imread('thay doi do sang\vung do vinh ha long\do sang 2\gia.JPG');
% image = image(:,:,3);
% figure, imshow(image);
% figure, imhist(image);
image = rgb2gray(image);
figure, imshow(image);
level = graythresh(image);
image1 = im2bw(image,level);
figure, imshow(image1);

for i=1:475
    for j=1:635
        if ((image1(i,j)+image1(i,j+1)+image1(i,j+2)+image1(i,j+3)+image1(i,j+4)+image1(i,j+5)+image1(i+1,j)+image1(i+2,j)+image1(i+3,j)+image1(i+4,j)+image1(i+5,j)+image1(i+5,j+1)+image1(i+5,j+2)+image1(i+5,j+3)+image1(i+5,j+4)+image1(i+5,j+5)+image1(i+4,j+5)+image1(i+3,j+5)+image1(i+2,j+5)+image1(i+1,j+5))<3)
         for k=(i+1):(i+4)
             for m=(j+1):(j+4)
                 image1(k,m)=0;
             end
         end
        end
        
     end
end

for i=1:480
    for j=1:640
        if image1(i,j)==1
            image(i,j) = 255;           
        end
    end
 end
figure, imshow(image);
figure, imhist(image);

[m,n] = size(image);
h = imhist(image);
tong = h(256);
input = reshape(image,m*n,1);
a = 1:4;
k = 1;
for i=1:m*n
    if input(i)<255 && input(i)>0
        a(k)=input(i);
        k = k + 1;
    end
end

a = a';

figure, histfit(a)

pd1 = fitdist(a,'Normal');


% x_values = -50:1:180;
% y1 = pdf(pd1,x_values);
% y2 = pdf(pd2,x_values);
% figure, plot(x_values,y1,'-r',x_values,y2,'-b')
pd1