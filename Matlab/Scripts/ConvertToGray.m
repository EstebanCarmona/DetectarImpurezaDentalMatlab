function Image = ConvertToGray(I)
[r, c, ch] = size(I); 
    if(ch == 3)
        Image = I(:,:,1) * .25 + I(:,:,2) * .5 + I(:,:,3) * .25;
    else
        Image = I; 
    end
end

