function [] = FFTPlot (signal,fs, name)

   % FFT
    [y_fft, freq] = FFT(signal,fs);
    pic = plot(freq, y_fft(1:length(freq)));
    xlim([0 500])
    

set(gcf,'Position',[100 100 571, 251]);

set(gcf, 'Color', 'None');
set(gca,'Color','None');
set(gca,'xcolor','w') % Set the x axis color to white
set(gca,'ycolor','w') % Set the y axis color to white

addpath('./export_fig_folder/');
save_path = strcat('../Figures/', name);
%save transparent figure
export_fig(save_path, '-png', '-eps', '-transparent');
end