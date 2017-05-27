function output = namnhannam( R )
%NAMNHANNAM Summary of this function goes here
%   Detailed explanation goes here
otrang = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            otrang = otrang +1;
            R(i,j)=0;
        end
    end
end

for i=1:476
    for j=1:636
        if (R(i,j) == 0 & R(i,j+1) == 0 & R(i,j+2) == 0 & R(i,j+3) == 0 & R(i,j+4) == 0 &  R(i+1,j+4) == 0 & R(i+2,j+4) == 0 & R(i+3,j+4) == 0 & R(i+4,j+4) == 0 & R(i+4,j+3) == 0 & R(i+4,j+2) == 0 & R(i+4,j+1) == 0 & R(i+4,j) == 0 & R(i+3,j) == 0 & R(i+2,j) == 0 & R(i+1,j) == 0    )
        
            if R(i+1,j+1)== 255
                otrang = otrang +1;
                R(i+1,j+1)=0;
            end
            if R(i+1,j+2)== 255
                otrang = otrang +1;
                R(i+1,j+2)=0;
            end
            if R(i+1,j+3)== 255
                otrang = otrang +1;
                R(i+1,j+3)=0;
            end
            if R(i+2,j+1)== 255
                otrang = otrang +1;
                R(i+2,j+1)=0;
            end
            if R(i+2,j+2)== 255
                otrang = otrang +1;
                R(i+2,j+2)=0;
            end
            if R(i+2,j+3)== 255
                otrang = otrang +1;
                R(i+2,j+3)=0;
            end
            if R(i+3,j+1)== 255
                otrang = otrang +1;
                R(i+3,j+1)=0;
            end
            if R(i+3,j+2)== 255
                otrang = otrang +1;
                R(i+3,j+2)=0;
            end
            if R(i+3,j+3)== 255
                otrang = otrang +1;
                R(i+3,j+3)=0;
            end
            
        end
    end
end
output = otrang;
end

