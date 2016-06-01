% created by wykys 2016

clc
close all
clear all

folder = ls('img');
folder = folder(3:end,:);

for i = 1:size(folder, 1)
    url = strcat('img\', folder(i,:));
    img = imread(url);
    baw = IMG_uncolor(img);
    edg = IMG_edge(img);
    
    zatazeno = ( sum(sum(baw)) * 100 ) / ( size(baw, 1) * size(baw, 2) );    
    prsi = ( sum(sum(edg)) * 100 ) / ( size(edg, 1) * size(edg, 2) );
    
    rgb1 = cat(3, baw,baw,baw);
    rgb2 = cat(3, edg,edg,edg);
    
    if zatazeno > 80 && prsi > 30
       figure('Name', [ '  <<< ZATAZENO A PRSI >>>' url ]);
    elseif zatazeno < 0.5 && prsi < 10
            figure('Name', [ ' <<< JASNO >>>' url ]);
    elseif prsi > zatazeno && prsi > 25 && abs(zatazeno - prsi) > 20
        figure('Name', [ ' <<< PRSI >>>' url ]);
    else
        figure('Name', [ ' <<< ZATAZENO  >>>' url ]);    
    end
    
%    subplot(3,1,1)
    image(img);
    axis equal
%     subplot(3,1,2)
%     image(~rgb1);
%     axis equal
%     subplot(3,1,3)
%     image(~rgb2);    
%     axis equal
end

