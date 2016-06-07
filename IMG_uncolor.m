% created by wykys 2016

function [ img ] = IMG_uncolor( rgb )
% funkce vací logickou matici 1 - pokud je intenciza větší neř prahová
% hodnota, jinak 0
    
    % záskáme jednotlivé barevné složky z rgb dat
    r = double(rgb(:,:,1));
    g = double(rgb(:,:,2));
    b = double(rgb(:,:,3));
    % určení prahové hodnoty pro devinyci změny a tím pádem hrany
    prah = 380;
    % spočítáme jas
    jas = r + g + b;
    % definice nulové matice o rozměrech obrázku
    img = zeros(size(jas,1), size(jas,2));
    % procházíme obrázek od 1. po poslední pixel
    for y = 1:size(jas,1)
        for x = 1:size(jas,2)
            % pokud jas v určitém místě překrocí prahocou hodnotu nahradíme
            % hodnotu 0, jinak je hodnota 1
            if jas(y,x) > prah
                img(y,x) = 0;                
            else
                img(y,x) = 1;                
            end
        end
    end
    % vrátíme logickou matici, ke 1 je jas > než prahová hodnota 0 < než
    % prahová hodnota
    img = logical(img);    
end

