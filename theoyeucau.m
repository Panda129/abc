imageM1 = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\1.JPG');
imageM2 = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\3.JPG');

imageFA = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\gia.JPG');

M1 = rgb2gray(imageM1);
M2 = rgb2gray(imageM2);

FA = rgb2gray(imageFA);
% 
% figure; imhist(M1); title('bieu do historgram cua tien that M1');
% figure; imhist(M2); title('bieu do historgram cua tien that M2');
%figure; imhist(NM); title('bieu do historgram cua tien that NM');
%figure; imhist(OS); title('bieu do historgram cua tien that OS');
%figure; imhist(PF); title('bieu do historgram cua tien that PF');

% figure; imhist(FA); title('bieu do histogram cua tien gia');

hM1 = imhist(M1);
hM2 = imhist(M2);
hFA = imhist(FA);

hTB = zeros(256,1);

Tong = 0;
size = 0;
for i=1:256
    hTB(i)= (hM1(i)+hM2(i))/2;
    Tong = Tong + abs(hTB(i)-hFA(i));
    size = hTB(i) + size;
end
saiso = Tong/size;
x = 1:256;
figure;
plot(x, hFA,'r-',x, hM1,'g-', x, hM2,'b-');
% title(saiso)
ylim([0 5000])
xlim([0 256]);


