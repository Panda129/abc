% function out = saisohisvsmaster(input1,input2)

imageM1 = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\1.JPG');
% figure; imshow(imageM1);

imageFA = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\gia.JPG');
% figure; imshow(imageFA);

M1R = rgb2gray(imageM1);

FAR = rgb2gray(imageFA);

% figure; imhist(M1R); %title('bieu do historgram cua tien that M1');
% figure; imhist(FAR); %title('bieu do histogram cua tien gia');

hM1R = imhist(M1R);

hFAR = imhist(FAR);

TongR = 0;

sizeR = 0;

for i=1:256
    TongR = TongR + abs(hM1R(i)-hFAR(i));
    sizeR = hM1R(i) + sizeR;
end
saisoR = TongR/sizeR;
x = 1:256;
figure, plot(x, hFAR,'b-',x, hM1R,'r-'); title(saisoR)
ylim([0 5000])
xlim([0 256]);
