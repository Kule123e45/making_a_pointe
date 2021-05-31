clear all

myDir = 'C:\Users\Luke Hillery\Documents\DE4\SOLO\SATRA\Processed Scans'; %gets directory
myFiles = dir(fullfile(myDir,'*')); %gets all stl files in struct
N = setdiff({myFiles([myFiles.isdir]).name},{'.','..'}); % list of subfolders of D.
stl_sizes=[];

mainfolder = 'C:\Users\Luke Hillery\Documents\DE4\SOLO\SATRA\Processed Scans';
subfolders = dir(mainfolder);
subfolders = subfolders([subfolders.isdir] & ~startsWith({subfolders.name},'.'));
for i = 1:length(subfolders)
    files = dir(fullfile(mainfolder,subfolders(i).name,'*.stl'));
    for k = 1:length(files);
        fullFileName = fullfile(mainfolder,subfolders(i).name,files(k).name);
        fprintf(1, 'Now reading %s\n', fullFileName);
        f = fopen(fullFileName,'r');
        rd = fread(f,inf,'uint8=>uint8');
        numTriangles = typecast(rd(81:84),'uint32');
        stl_sizes(i,k) = numTriangles;           
        fclose(f);
    end
   % save here
end

stl_sizes = stl_sizes(:);


format("longG");
stl_size_mean = mean(stl_sizes)
stl_size_stdev = std(stl_sizes)
T0 = bplot(stl_sizes,'points','whisker',3,'linewidth',1);
title(".stl Triangle Count")
ylabel('Triangle Count')
lg = legend(T0);
lg.Location = 'northeast';
set(gca,'xtick',[]);

