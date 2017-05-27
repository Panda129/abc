image = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\4.JPG');

R = rgb2gray(image);
figure;
imhist(R)
for i=1:480
    for j=1:640
        if R(i,j)>80
            R(i,j) = 255;           
        else
            R(i,j) = 0;          
        end
    end
end
figure;
imshow(R)