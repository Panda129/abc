function output = banhanba( R )
%BANHANBA Summary of this function goes here
%   Detailed explanation goes here
biendem = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            biendem = biendem +1;
        end
    end
end
output = biendem;
end

