% created by wykys 2016

function [ img ] = IMG_uncolor( rgb )
% This function return compare image matrix
    r = double(rgb(:,:,1));
    g = double(rgb(:,:,2));
    b = double(rgb(:,:,3));
    
    jas = r + g + b;
    img = zeros(size(jas,1), size(jas,2));
    for y = 1:size(jas,1)
        for x = 1:size(jas,2)
            if jas(y,x) > 380
                img(y,x) = 0;                
            else
                img(y,x) = 1;                
            end
        end
    end
    img = logical(img);    
end

