function out = loaidiem( input )
%LOAIDIEM Summary of this function goes here
%   Detailed explanation goes here
    [m,n] = size(input);
    h = imhist(input);
    tong = h(256);
    input = reshape(input,m*n,1);
    I = 1:(m*n-tong);
    k = 1;
    for i=1:m*n
       if input(i)~=255
               I(k)=input(i);
               k = k + 1;
       end
    end
    out = I;
end

