function output = sigmatoananh( input )
%SIGMATOANANH Summary of this function goes here
%   Detailed explanation goes here

image = rgb2gray(input);
a = reshape(image,480*640,1);
a = double(a);
pd = fitdist(a,'Normal');
output = pd.sigma;

end

