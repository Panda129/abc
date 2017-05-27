image = imread('thay doi do sang\quoc huy\do sang 2\8.jpg');
R1 = image(:, :, 2);
%figure; imshow(R1);
image = rgb2gray(image);

level = graythresh(R1);
image = im2bw(R1,(level-0.1));
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


biendem = 0;
tongsacnet = 0;

R1 = uint64(R1);
for i=2:479
    for j=2:639
        if (image(i,j)== 0 & ( image(i-1,j-1)==1 || image(i-1,j)==1 || image(i-1,j+1)==1 || image(i,j+1)==1 || image(i+1,j+1)==1 || image(i+1,j)==1 || image(i+1,j-1)==1 || image(i, j-1)==1))
            biendem = biendem +1;
            tonglon=0;
            k=0;
            tongnho=0;
            tongnho = tongnho + image(i,j);
            n=1;
            sacnet = 0;
            if image(i-1,j-1)==1
                tonglon = tonglon + R1(i-1,j-1);
                k = k+1;
            else
                tongnho = tongnho + R1(i-1,j-1);
                n = n+1;
            end
            %
            %
            if image(i-1,j)==1
                tonglon = tonglon + R1(i-1,j);
                k = k+1;
            else
                tongnho = tongnho + R1(i-1,j);
                n = n+1;
            end
            %
            %
            if image(i-1,j+1)==1
                tonglon = tonglon + R1(i-1,j+1);
                k = k+1;
            else
                tongnho = tongnho + R1(i-1,j+1);
                n = n+1;
            end
            %
            %
            if image(i,j+1)==1
                tonglon = tonglon + R1(i,j+1);
                k = k+1;
            else
                tongnho = tongnho + R1(i,j+1);
                n = n+1;
            end
            %
            %
            if image(i+1,j+1)==1
                tonglon = tonglon + R1(i+1,j+1);
                k = k+1;
            else
                tongnho = tongnho + R1(i+1,j+1);
                n = n+1;
            end
            %
            %
            if image(i+1,j)==1
                tonglon = tonglon + R1(i+1,j);
                k = k+1;
            else
                tongnho = tongnho + R1(i+1,j);
                n = n+1;
            end
            %
            %
            if image(i+1,j-1)==1
                tonglon = tonglon + R1(i+1,j-1);
                k = k+1;
            else
                tongnho = tongnho + R1(i+1,j-1);
                n = n+1;
            end
            %
            %
            if image(i,j-1)==1
                tonglon = tonglon + R1(i,j-1);
                k = k+1;
            else
                tongnho = tongnho + R1(i,j-1);
                n = n+1;
            end
           
            sacnet = tonglon/k - tongnho/n;
            tongsacnet = tongsacnet + sacnet;
        end
    end
end
tb = tongsacnet/biendem;


