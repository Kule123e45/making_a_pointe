clear all
close all

%collate raw scan data
myDir = 'C:\Users\Luke Hillery\Documents\DE4\SOLO\SATRA\All Scans'; %gets directory
myFiles = dir(fullfile(myDir,'*.stl')); %gets all wav files in struct
stl_sizes=[];

for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  f = fopen(fullFileName,'r');
  rd = fread(f,inf,'uint8=>uint8');
  numTriangles = typecast(rd(81:84),'uint32');
  stl_sizes(k) = numTriangles;
end

%collate cleaned scan data 
mainfolder = 'C:\Users\Luke Hillery\Documents\DE4\SOLO\SATRA\Processed Scans';
subfolders = dir(mainfolder);
subfolders = subfolders([subfolders.isdir] & ~startsWith({subfolders.name},'.'));
cleaned_stl_sizes = [];
for i = 1:length(subfolders)
    files = dir(fullfile(mainfolder,subfolders(i).name,'*.stl'));
    for k = 1:length(files);
        fullFileName = fullfile(mainfolder,subfolders(i).name,files(k).name);
        fprintf(1, 'Now reading %s\n', fullFileName);
        f = fopen(fullFileName,'r');
        rd = fread(f,inf,'uint8=>uint8');
        numTriangles = typecast(rd(81:84),'uint32');
        cleaned_stl_sizes(i,k) = numTriangles;           
        fclose(f);
    end
   % save here
end


cleaned_stl_sizes=cleaned_stl_sizes(:);
stl_sizes_matrix = [stl_sizes(:), cleaned_stl_sizes(:)];
mean(cleaned_stl_sizes)
std(cleaned_stl_sizes)

%visualisation
figure;
subplot(2,2,[1,3])
T0 = bplot(stl_sizes_matrix,'points','whisker',5,'linewidth',1);
title(".stl Triangle Count");
%xlabel('raw','cleaned');
set(gca,'XTick',1:1:2); %Specify x axis step size
ylabel('Triangle Count');
lg = legend(T0);
lg.Location = 'northeast';

subplot(2,2,2)
T1 = bplot(stl_sizes,'points','whisker',3,'linewidth',1);
title("1. Raw Scan Triangle Count");
ylabel('Triangle Count');
set(gca,'xtick',[]);

subplot(2,2,4)
T2 = bplot(cleaned_stl_sizes,'points','whisker',3,'linewidth',1);
title("2. Cleaned .stl Triangle Count");
ylabel('Triangle Count');
set(gca,'xtick',[]);