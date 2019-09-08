function [] = Figures(signal, name)

% To save plots for the GUI

fig = figure('visible', 'off');

plot(signal);

[~ , n]= size(signal);

if n == 3
    hold on;
    plot(signal(:,2) ,'r','linewidth',1);
    plot(signal(:,3),'y--x');
end

set(gcf,'Position',[100 100 571, 251]);

set(gcf, 'Color', 'None');
set(gca,'Color','None');
set(gca,'xcolor',[.32 .32 .32]) % 'k') % Set the x axis color to black
set(gca,'ycolor',[.32 .32 .32]) % 'k') % Set the y axis color to black
set(gcf, 'InvertHardCopy', 'off'); % Apply gca changes to plot that is going to be saved

addpath('./export_fig_folder/');
save_path = strcat('../Figures/', name, '.png');

% Save transparent figure
    
    % export_fig(save_path, '-png', '-eps', '-transparent');


% Save transparent figure using imwrite
    
    im_fig = getframe(fig);
    im_fig = frame2im(im_fig);
    imwrite(im_fig, save_path, 'png') %,'Transparency', [0 0 0])


end