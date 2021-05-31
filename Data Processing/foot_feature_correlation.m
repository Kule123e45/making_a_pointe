clear all
close all

dataset = readtable('measurements.csv');
dataset_headers = dataset.Properties.VariableNames;
dataset_tab = table2array(dataset);
caption = 'Correlation of Foot Measurements with Correlation Coefficient, [Rho] and Sample Size';
fcnCorrMatrixPlot(dataset_tab,dataset_headers,caption);

figure;
dataset2 = readtable('measurements_vs_fit.csv');
dataset_headers2 = dataset2.Properties.VariableNames;
dataset_tab2 = table2array(dataset2);
caption2 = 'Correlation of Foot Measurements vs Achieved Fit, with Correlation Coefficient, [Rho] and Sample Size';
fcnCorrMatrixPlot(dataset_tab2,dataset_headers2,caption2);

figure;
dataset3 = readtable('instep_corr.csv');
dataset_headers3 = dataset3.Properties.VariableNames;
dataset_tab3 = table2array(dataset3);
caption3 = 'Correlation of Instep Measurements';
fcnCorrMatrixPlot(dataset_tab3,dataset_headers3,caption3);