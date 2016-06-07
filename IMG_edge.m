% created by wykys 2016

function [ edg ] = IMG_edge( rgb )
% funkce vrátí logickou matici obrázku, hrany mají hodnotu 1, zbytek 0
    
    % záskáme jednotlivé barevné složky z rgb dat
    r = double(rgb(:,:,1));
    g = double(rgb(:,:,2));
    b = double(rgb(:,:,3));
    % určení prahové hodnoty pro devinyci změny a tím pádem hrany
    prah = 15;
    % spočítáme jas
    jas = r + g + b;
    % definice nulové matice o rozměrech obrázku
    edg = zeros(size(jas,1), size(jas,2));
    % procházíme obrázek, vynecháváme 1. a poslední rádek a sloupec
    for y = 2:size(jas,1)-1
        for x = 2:size(jas,2)-1
            % pokud dojde v okolí aktuálního pixelu ke změně jasu o
            % prahovou hodnotu, označíme pixel za hranu
            if abs(jas(y,x) - jas(y,x+1)) > prah || abs(jas(y,x) - jas(y,x-1)) > prah || abs(jas(y,x) - jas(y+1,x)) > prah || abs(jas(y,x) - jas(y-1,x)) > prah 
                edg(y,x) = 1;                
            else
                edg(y,x) = 0;                
            end
        end
    end
    % vrazíme logický blok, kde 1 je hrana 0 nic
    edg = logical(edg);    
end

