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

%show ?nh ?� ph�n v�ng ra, s? th?y c�c ch?m tr?ng nh? trong ?nh ph�n v�ng.
%figure;
%imshow(R);

%t�nh s? ?i?m tr?ng ??n, d�ng ma tr?n 3x3 bao quanh ?i?m trung t�m, ?i?m
%trung t�m ph?i l� ?i?m tr?ng v� c�c ?i?m xung quanh ph?i l� ?i?m ?en.
biendem1 = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            biendem1 = biendem1 +1;
        end
    end
end


% c� 2 ki?u ?i?m tr?ng ?�i, l� ?i?m tr?ng d?c v� ngang, khi t�nh ?i?m tr?ng
% ?�i th� cho ph�p ma tr�n bao b?c 2 ?i?m tr?ng trung t�m c� th? c� t?i ?a
% 2 � tr?ng ? ngo�i(t?i sao th� tao th�ch th?)
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

%??m to�n b? s? � tr?ng, v�ng for ??u ti�n l� ??m ri�ng th?ng � ??n, v� n�
%th??ng b? ??m s�t do n� n?m ? r�a c?a ?nh, khi ?� ma tr?n 5x5 hay v?p ph?i
%v�ng n?n tr?ng, sau khi ??m ?c th?ng ?i?m tr?ng n�o th� t chuy?n n� th�nh
%?en, ?? show ra, ?? ?�nh gi� b?ng m?t th??ng ?nh ch?a l?c nhi?u tr?ng v� ?� l?c nhi?u.
otrang = 0;
for i=2:479
    for j=2:639
        if (R(i-1,j-1) == 0 & R(i-1, j) == 0 & R(i-1,j+1) == 0 & R(i,j-1) == 0 & R(i,j +1) == 0 & R(i+1,j-1) == 0 & R(i+1,j)== 0 & R(i+1,j+1)== 0 & R(i,j)==255 )
            otrang = otrang +1;
            R(i,j)=0;
        end
    end
end
%??m s? � tr?ng v?i ma tr?n 5x5
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
    

            
            
