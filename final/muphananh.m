function output = muphananh( input )
%MUPHANANH Summary of this function goes here
%   Detailed explanation goes here

image = rgb2gray(input);
level = graythresh(image);
image1 = im2bw(image,level);

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

pd1 = fitdist(a,'Normal');
output = pd1.mu;

end

