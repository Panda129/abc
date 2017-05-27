function output = sigma( R,giatri)
%SIGMA Summary of this function goes here
%   Detailed explanation goes here
for i=1:480
    for j=1:640
        if R(i,j)>giatri
            R(i,j) = 255;
        end
    end
end

a = loaidiem(R);
a = a';
pd = fitdist(a,'Normal');

output = pd;

end

