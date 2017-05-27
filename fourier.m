clear;
c = imread('thay doi do sang\vung xanh vinh ha long\do sang max\8.JPG');
c = double(rgb2gray(c));
F = fft2(c);
figure, imshow(F);
Fc = fftshift(F);
figure, imshow(Fc);
AF = abs(Fc);
M = max(AF);
M = max(M);
thresh = M/1000;
TH=0;
for i=1:480 
    for j = 1:640
        if F(i,j)>thresh
            TH=TH+1;
        end
    end
end

FM = (TH)/(640*480);