x1=load('迭代次数.txt');
plot(x1,'*-','LineWidth',1.5,'color','b')
set(gca,'Fontname','Times New Roman','Fontsize',17);
xlabel('Number of iterations','Fontname','Times New Roman','Fontsize',17,'FontWeight','bold')
ylabel('FuzzyEn','Fontname','Times New Roman','Fontsize',17,'FontWeight','bold')
xlim([1 10])
set(gca,'xtick',[1:1:10]);
% title('Convergence curve','Fontsize',12,'FontWeight','bold','Fontname','Times New Roman')

x1=load('迭代次数.txt');
plot(x1,'-bo','LineWidth',1.3,'markersize',7)
set(gca,'Fontname','Times New Roman','Fontsize',17);
xlabel('\fontname{宋体}迭代次数','FontSize',17)
% xlabel('Number of iterations','Fontname','Times New Roman','Fontsize',17)
ylabel('\fontname{宋体}模糊熵','FontSize',17)
xlim([1 10])
% ylim([4e-05 4.5e-05])
set(gca,'xtick',[1:1:10]);
% set(gca,'ytick',[4e-05:0.1e-05:4.5e-05]);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);

% 
h=legend('SMA');
set(h,'Fontname','Times New Roman','Fontsize',14);