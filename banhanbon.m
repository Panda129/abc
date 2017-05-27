function output = banhanbon (R)
%BANHANBON Summary of this function goes here
%   Detailed explanation goes here
biendem=0;
  k=0;
for i=2:479
    for j=2:638
       
        if R(i-1,j-1)== 255
            k= k +1;
        end
        if R(i-1,j)== 255
            k= k +1;
        end
        if R(i-1,j+1)== 255
            k= k +1;
        end
        if R(i-1,j+2)== 255
            k= k +1;
        end
        if R(i,j+1)== 255
            k= k +1;
        end
        if R(i+1,j+2)== 255
            k= k +1;
        end
        if R(i+1,j+1)== 255
            k= k +1;
        end
        if R(i+1,j)== 255
            k= k +1;
        end
        if R(i+1,j-1)== 255
            k= k +1;
        end
        if R(i,j-1)== 255
            k= k +1;
        end
        if (R(i,j)== 255 & R(i,j+1)== 255 & k < 3)
            biendem = biendem +1;
        end
        k=0;
        
    end
end

for i=2:478
    for j=2:639
       
        if R(i-1,j-1)== 255
            k= k +1;
        end
        if R(i-1,j)== 255
            k= k +1;
        end
        if R(i-1,j+1)== 255
            k= k +1;
        end
        if R(i,j+1)== 255
            k= k +1;
        end
        if R(i+1,j+1)== 255
            k= k +1;
        end
        if R(i+2,j+1)== 255
            k= k +1;
        end
        if R(i+2,j)== 255
            k= k +1;
        end
        if R(i+2,j-1)== 255
            k= k +1;
        end
        if R(i+1,j-1)== 255
            k= k +1;
        end
        if R(i,j-1)== 255
            k= k +1;
        end
        if (R(i,j)== 255 & R(i+1,j)== 255 & k < 3)
            biendem = biendem +1;
        end
        k=0;
        
    end
end
output = biendem;
end

