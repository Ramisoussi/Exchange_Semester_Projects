% importing low_resolution image and converting it into grey-scale image

image1 =  imread('Archer (512)','BMP');
im1 = im2double(image1);
im1 = rgb2gray(im1);


%% interpolation step


s = size(im1);

new = zeros(s(1),s(1));

for i=1:s(1)
    new(1,2*i-1) = im1(1,i);
    new(1,2*i) = im1(1,i);
    new(2*i-1,1) = im1(i,1);
    new(2*i,1) = im1(i,1);
    
    new(s(1)*2,2*i-1) = im1(s(1),i);
    new(s(1)*2,2*i) = im1(s(1),i);
    new(2*i-1,s(2)*2) = im1(i,s(2));
    new(2*i,s(2)*2) = im1(i,s(2));
end
    

for i=1:s(1)
    for j=1:s(1)
        
        %first case 
        
        if i>1 & j>1
            d1 = abs(im1(i-1,j) - im1(i,j));
            d2 = abs(im1(i,j-1) - im1(i,j));
            d3 = abs(im1(i-1,j-1)- im1(i,j));
            d4 = abs(im1(i-1,j) - im1(i,j-1));
        
        
        
            mini = d1;
            if d2<mini
                mini = d2;
            end
            if d3<mini
                mini = d3;
            end
            if d4<mini
                mini = d4;
            end
        
            if mini == d1
                new(i*2-1,2*j-1) = (im1(i,j)+im1(i-1,j))/2;
            elseif mini == d2
                new(i*2-1,2*j-1) = (im1(i,j)+im1(i,j-1))/2;
            elseif mini == d3
                new(i*2-1,2*j-1) = (im1(i,j)+im1(i-1,j-1))/2;
            else
                new(i*2-1,2*j-1) = (im1(i,j)+(im1(i-1,j)+im1(i,j-1))/2)/2;
            end
        end
        
        
        % second case 
        
        
        if i>1 & j < s(1)
            d1 = abs(im1(i-1,j) - im1(i,j));
            d2 = abs(im1(i,j+1) - im1(i,j));
            d3 = abs(im1(i-1,j+1)- im1(i,j));
            d4 = abs(im1(i-1,j) - im1(i,j+1));
        
        
        
            mini = d1;
            if d2<mini
                mini = d2;
            end
            if d3<mini
                mini = d3;
            end
            if d4<mini
                mini = d4;
            end
        
            if mini == d1
                new(i*2-1,2*j) = (im1(i,j)+im1(i-1,j))/2;
            elseif mini == d2
                new(i*2-1,2*j) = (im1(i,j)+im1(i,j+1))/2;
            elseif mini == d3
                new(i*2-1,2*j) = (im1(i,j)+im1(i-1,j+1))/2;
            else
                new(i*2-1,2*j) = (im1(i,j)+(im1(i-1,j)+im1(i,j+1))/2)/2;
            end
        end
        
        % third case 
        
        if i < s(1) & j > 1
            d1 = abs(im1(i+1,j) - im1(i,j));
            d2 = abs(im1(i,j-1) - im1(i,j));
            d3 = abs(im1(i+1,j-1)- im1(i,j));
            d4 = abs(im1(i+1,j) - im1(i,j-1));
        
        
        
            mini = d1;
            if d2<mini
                mini = d2;
            end
            if d3<mini
                mini = d3;
            end
            if d4<mini
                mini = d4;
            end
        
            if mini == d1
                new(i*2,2*j-1) = (im1(i,j)+im1(i+1,j))/2;
            elseif mini == d2
                new(i*2,2*j-1) = (im1(i,j)+im1(i,j-1))/2;
            elseif mini == d3
                new(i*2,2*j-1) = (im1(i,j)+im1(i+1,j-1))/2;
            else
                new(i*2,2*j-1) = (im1(i,j)+(im1(i+1,j)+im1(i,j-1))/2)/2;
            end
        end
        
        % fourth case 
        
        if i < s(1) & j < s(2)
            d1 = abs(im1(i+1,j) - im1(i,j));
            d2 = abs(im1(i,j+1) - im1(i,j));
            d3 = abs(im1(i+1,j+1)- im1(i,j));
            d4 = abs(im1(i+1,j) - im1(i,j+1));
        
        
        
            mini = d1;
            if d2<mini
                mini = d2;
            end
            if d3<mini
                mini = d3;
            end
            if d4<mini
                mini = d4;
            end
        
            if mini == d1
                new(i*2,2*j) = (im1(i,j)+im1(i+1,j))/2;
            elseif mini == d2
                new(i*2,2*j) = (im1(i,j)+im1(i,j+1))/2;
            elseif mini == d3
                new(i*2,2*j) = (im1(i,j)+im1(i+1,j+1))/2;
            else
                new(i*2,2*j) = (im1(i,j)+(im1(i+1,j)+im1(i,j+1))/2)/2;
            end
        end
    end
end

subplot(121)
imshow(im1)
title('Original image 512 X 512')



subplot(122)
imshow(new)
title('Interpolated image 1024 X 1024')


%% Importing high resolution image and resizing it

original =  imread('Archer (1024)','TIF');
original = im2double(original);
original = rgb2gray(original);


original_interpolated= zeros(1023,1023);
for i=1:1023
    for j=1:1023
        original_interpolated(i,j)=original(i,j);
    end
end
        
%% Showing differences


linear = interp2(im1,1,'bilinear');

nearest = interp2(im1,1,'nearest');

cubic = interp2(im1,1,'cubic');

subplot(141)
imshow(linear)
title('bilinear')

subplot(142)
imshow(nearest)
title('nearest')

subplot(143)
imshow(cubic)
title('cubic')

subplot(144)
imshow(new)
title('our image')


psnr_bilinear = Peak_Signal_Noise_Ratio(original_interpolated,linear)

psnr_nearest = Peak_Signal_Noise_Ratio(original_interpolated,nearest)

psnr_cubic = Peak_Signal_Noise_Ratio(original_interpolated,cubic)

our_psnr = Peak_Signal_Noise_Ratio(original, new)












