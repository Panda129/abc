function output = histogram( input1, input2)
%HISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
% function out = saisohisvsmaster(input1,input2)

M1R = rgb2gray(input1);

FAR = rgb2gray(input2);

hM1R = imhist(M1R);

hFAR = imhist(FAR);

TongR = 0;

sizeR = 0;

for i=1:256
    TongR = TongR + abs(hM1R(i)-hFAR(i));
    sizeR = hM1R(i) + sizeR;
end
output = TongR/sizeR;

end

