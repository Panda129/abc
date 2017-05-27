image = imread('thay doi do sang\so 200k goc tren cung ben phai\do sang 2\2.JPG');
% figure;
% imshow(image);
R = rgb2gray(image);    

level = graythresh(R);
for i=1:480 
    for j=1:640
        if R(i,j)>level*255
            R(i,j) = 255;
        else
            R(i,j) = 0;
        end
    end
end
figure;
imshow(R);

%show ?nh ?ã phân vùng ra, s? th?y các ch?m tr?ng nh? trong ?nh phân vùng.
%figure;
%imshow(R);

%tính s? ?i?m tr?ng ??n, dùng ma tr?n 3x3 bao quanh ?i?m trung tâm, ?i?m
%trung tâm ph?i là ?i?m tr?ng và các ?i?m xung quanh ph?i là ?i?m ?en.
biendem1 = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            biendem1 = biendem1 +1;
        end
    end
end


% có 2 ki?u ?i?m tr?ng ?ôi, là ?i?m tr?ng d?c và ngang, khi tính ?i?m tr?ng
% ?ôi thì cho phép ma trân bao b?c 2 ?i?m tr?ng trung tâm có th? có t?i ?a
% 2 ô tr?ng ? ngoài(t?i sao thì tao thích th?)
biendem2=0;
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
            biendem2 = biendem2 +1;
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
            biendem2 = biendem2 +1;
        end
        k=0;
        
    end
end

%??m toàn b? s? ô tr?ng, vòng for ??u tiên là ??m riêng th?ng ô ??n, vì nó
%th??ng b? ??m sót do nó n?m ? rìa c?a ?nh, khi ?ó ma tr?n 5x5 hay v?p ph?i
%vùng n?n tr?ng, sau khi ??m ?c th?ng ?i?m tr?ng nào thì t chuy?n nó thành
%?en, ?? show ra, ?? ?ánh giá b?ng m?t th??ng ?nh ch?a l?c nhi?u tr?ng và ?ã l?c nhi?u.
otrang = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            otrang = otrang +1;
            R(i,j)=0;
        end
    end
end
%??m s? ô tr?ng v?i ma tr?n 5x5
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
%figure;
%imshow(R);
    

            
            
