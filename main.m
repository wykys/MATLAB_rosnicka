% created by wykys 2016

clc
close all
clear all

% uložení výpisu složky
folder = ls('img');
% ořízneme výpis o první dvě položky to jest . 
% a .. (adtuální adresáš a adresář nadřazený)
folder = folder(3:end,:);

% procházíme položky ze složky
for i = 1:size(folder, 1)
    % k jmenu souboru přidáme i jmeno složky (vytvoříme url adresu)
    url = strcat('img\', folder(i,:));
    % načteme obrázek
    img = imread(url);
    % na obrázek aplikujem "komparační" filtr
    baw = IMG_uncolor(img);
    % na obrázek proženeme detekcí hran "derivační" filtr
    edg = IMG_edge(img);
    
    % vypočítáme procentuální množství černé pro oba filtry množství černé
    zatazeno = ( sum(sum(baw)) * 100 ) / ( size(baw, 1) * size(baw, 2) );    
    prsi = ( sum(sum(edg)) * 100 ) / ( size(edg, 1) * size(edg, 2) );
    
    % vytvožení rgb dat, kteér můžeme vykreslit
    rgb1 = cat(3, baw,baw,baw);
    rgb2 = cat(3, edg,edg,edg);
    
    % vyhodnocení počasí
    if zatazeno > 80 && prsi > 30
       
       pocasi = 'ZATAZENO A PRSI';
    elseif zatazeno < 0.5 && prsi < 10            
            pocasi = 'JASNO';
    elseif prsi > zatazeno && prsi > 27 && abs(zatazeno - prsi) > 20        
        pocasi = 'PRSI';
    else        
        pocasi = 'ZATAZENO';
    end
    
    % záverezné vykreslení
    figure('Name', url );
    subplot(2,1,1)
    image(img);
    axis equal
    title(pocasi)
    subplot(2,2,3)
    image(~rgb1);
    axis equal
    title('komparační filtr')
    subplot(2,2,4)
    image(~rgb2);    
    axis equal
    title('derivační filtr')
    
end

