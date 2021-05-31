% close all
% 
% figure;
% %Plot all 3 boxplots on one set of axes across the top of the figure
% subplot(2,3,[1,2,3])
% T0 = bplot(data_compiled,'points');
% title("'Fit' by Input Complexity")
% xlabel('Input Data Complexity')
% ylabel('RMS Euclidean Distance (mm)')
% lg = legend(T0);
% lg.Location = 'northeast';
% 
% %Plot zoomed versions of each boxplot
% subplot(2,3,4)
% T1 = bplot(data_1d,'points');
% xlabel('Input Data Complexity')
% ylabel('Distance (mm)')
% 
% subplot(2,3,5)
% T2 = bplot(data_2d,'points');
% xlabel('Input Data Complexity')
% ylabel('Distance (mm)')
% 
% subplot(2,3,6)
% T3 = bplot(data_3d,'points');
% xlabel('Input Data Complexity')
% ylabel('Distance (mm)')

close all

figure;
%Plot all 3 boxplots on one set of axes across the top of the figure
subplot(3,3,[1,2,3,4,5,6])
%'whisker' specifies percentile that whiskers are plotted at
%'linewidth' specifies line weight of the plot
T0 = bplot(data_compiled,'points','whisker',5,'linewidth',1);
title("'Fit' by Input Complexity");
xlabel('Input Data Complexity (Dimensions)');
set(gca,'XTick',1:1:3); %Specify x axis step size
ylabel('RMS Euclidean Distance (mm)');
lg = legend(T0);
lg.Location = 'northeast';

%Plot zoomed versions of each boxplot
subplot(3,3,7)
T1 = bplot(data_1d,'points','whisker',5,'linewidth',1);
xlabel('1D Input Data');
set(gca,'xtick',[]);
ylabel('Distance (mm)');

subplot(3,3,8)
T2 = bplot(data_2d,'points','whisker',5,'linewidth',1);
xlabel('2D Input Data');
set(gca,'xtick',[]);
ylabel('Distance (mm)');

subplot(3,3,9)
T3 = bplot(data_3d,'points','whisker',5,'linewidth',1);
xlabel('3D Input Data');
set(gca,'xtick',[]);
ylabel('Distance (mm)');

