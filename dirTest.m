close all
clear all all
clearvars

localDir = dir;

fileCount = length(localDir);

labels = {};
images = {};
labelCount = 0;

for i = 3 : fileCount
    if ~localDir(i).isdir
        continue;
    end

    labelCount = labelCount + 1;
    labels{labelCount} = localDir(i).name;

    cd(strcat(localDir(i).folder, '/', localDir(i).name))
    imageDir = dir;
    imageCount = length(dir);

    labeledImages = cell(imageCount - 2, 1);
    for j = 3:imageCount
        imageUrl = strcat(localDir(i).folder, '/', localDir(i).name, '/', imageDir(j).name)
        labeledImages{j-2} = imageUrl;
    end
    
    cd ..
    images{labelCount} = labeledImages;
end

disp(labels);