function [] = Figures(signal, name)

pic = plot(signal);

set(gcf,'Position',[100 100 571, 251]);

set(gcf, 'Color', 'None');
set(gca,'Color','None');
set(gca,'xcolor','w') % Set the x axis color to white
set(gca,'ycolor','w') % Set the y axis color to white

addpath('./export_fig_folder/');
save_path = strcat('./pics/', name);
%save transparent figure
export_fig(save_path, '-png', '-eps', '-transparent');
end