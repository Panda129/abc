image = imread('thay doi do sang\vung do vinh ha long\do sang 1\gia.jpg');
image1 = rgb2gray(image);
level = graythresh(image1);
image = im2bw(image,level);
image = double(image);


for i=1:475
    for j=1:635
        if ((image(i,j)+image(i,j+1)+image(i,j+2)+image(i,j+3)+image(i,j+4)+image(i,j+5)+image(i+1,j)+image(i+2,j)+image(i+3,j)+image(i+4,j)+image(i+5,j)+image(i+5,j+1)+image(i+5,j+2)+image(i+5,j+3)+image(i+5,j+4)+image(i+5,j+5)+image(i+4,j+5)+image(i+3,j+5)+image(i+2,j+5)+image(i+1,j+5))<3)
         for k=(i+1):(i+4)
             for m=(j+1):(j+4)
                 image(k,m)=0;
             end
         end
        end
        
     end
 end



for i=1:480
    for j=1:640
        if image(i,j)== 1
            image1(i,j)=255;
        end
    end
end

biendem = 0;
tong = 0;
vector = 0;
tb = 0;

for i=2:479
    for j=2:639
        vertor = 0;
        if (image(i,j) == 0 & image(i,j-1) == 0 & image(i-1,j) == 0 & image(i,j+1) == 0 & image(i+1, j)==0 )
            x = image1(i,j+1)- image1(i, j-1);
            x = double(x);
            y = image1(i-1,j)- image1(i+1,j);
            y = double(y);
            biendem = biendem +1;
            vector = sqrt(x*x + y*y);
            tong = tong + vector;
        end
    end
end
tb = tong/biendem;

