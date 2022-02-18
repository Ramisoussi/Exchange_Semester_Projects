function y = Peak_Signal_Noise_Ratio(img1,img2)

l = [0 0 0];

[h w d] = size(img1);

for k=1:d
    s = 0;
    for i=1:h
        for j=1:w
            s = s + (img1(i,j,k)-img2(i,j,k))^2;
        end    
    end
    l(k) = s;   
end 

l = l/(h*w);

m = mean(l);

Max = max(img1(:));

y = 10*log10((Max^2)/m);

end







