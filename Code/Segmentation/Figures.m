function [] = Figures(signal, name)

pic = plot(signal);

[m , n]= size(signal);

if n == 3
    hold on;
    plot(signal(:,2) ,'r','linewidth',1);
    plot(signal(:,3),'y--x');
end

set(gcf,'Position',[100 100 571, 251]);

set(gcf, 'Color', 'None');
set(gca,'Color','None');
set(gca,'xcolor','k') % Set the x axis color to white
set(gca,'ycolor','k') % Set the y axis color to white

addpath('./export_fig_folder/');
save_path = strcat('../Figures/', name);
%save transparent figure
export_fig(save_path, '-png', '-eps', '-transparent');
end