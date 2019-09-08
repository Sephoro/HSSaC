function [] = FFTPlot (signal,fs, name)

    % To save FFT plots for the GUI
   
    fig = figure('visible', 'off');
   
    [y_fft, freq] = FFT(signal,fs);
    plot(freq, y_fft(1:length(freq)));
    xlim([0 500])
    
    set(gcf,'Position',[100 100 571, 251]);

    set(gcf, 'Color', 'None');
    set(gca,'Color','None');
    set(gca,'xcolor',[.32 .32 .32]) % 'k') % Set the x axis color to black
    set(gca,'ycolor',[.32 .32 .32]) % 'k') % Set the y axis color to black
    set(gcf, 'InvertHardCopy', 'off'); % Apply gca changes to plot that is going to be saved


    addpath('./export_fig_folder/');
    save_path = strcat('../Figures/', name, '.png');
    
    % Save transparent figure
        %export_fig(save_path, '-png', '-eps', '-transparent');
        
    % Save transparent figure using imwrite
    
    im_fig = getframe(fig);
    im_fig = frame2im(im_fig);
    imwrite(im_fig, save_path, 'png') %,'Transparency', [0 0 0])
    
end