clear all

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

format("longG");
stl_size_mean = mean(stl_sizes)
stl_size_stdev = std(stl_sizes)
T0 = bplot(stl_sizes,'points','whisker',3,'linewidth',1);
title(".stl Triangle Count")
ylabel('Triangle Count')
lg = legend(T0);
lg.Location = 'northeast';
set(gca,'xtick',[]);