% created by wykys 2016

function [ edg ] = IMG_edge( rgb )
% This function return gain edge
    r = double(rgb(:,:,1));
    g = double(rgb(:,:,2));
    b = double(rgb(:,:,3));
    prah = 15;
    jas = r + g + b;
    edg = zeros(size(jas,1), size(jas,2));
    for y = 2:size(jas,1)-1
        for x = 2:size(jas,2)-1
            if abs(jas(y,x) - jas(y,x+1)) > prah || abs(jas(y,x) - jas(y,x-1)) > prah || abs(jas(y,x) - jas(y+1,x)) > prah || abs(jas(y,x) - jas(y-1,x)) > prah 
                edg(y,x) = 1;                
            else
                edg(y,x) = 0;                
            end
        end
    end
    edg = logical(edg);    
end

