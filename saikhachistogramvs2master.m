imageM1 = imread('abc\that\OS\2.JPG');
imageM2 = imread('abc\that\LY\2.JPG');

imageFA = imread('abc\gia\2.JPG');

M1 = imageM1(:, :, 1);
M2 = imageM2(:, :, 1);

FA = imageFA(:, :, 1);

figure; imhist(M1); title('bieu do historgram cua tien that M1');
figure; imhist(M2); title('bieu do historgram cua tien that M2');
%figure; imhist(NM); title('bieu do historgram cua tien that NM');
%figure; imhist(OS); title('bieu do historgram cua tien that OS');
%figure; imhist(PF); title('bieu do historgram cua tien that PF');

figure; imhist(FA); title('bieu do histogram cua tien gia');

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
plot(x, hFA,'b-',x, hTB,'r-'); title(saiso)
ylim([0 5000])
xlim([0 256]);


