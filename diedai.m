x1=load('迭代次数sma.txt');
x2=load('迭代次数ga.txt');
x3=load('迭代次数pso.txt');
plot(x1,'-ro','LineWidth',1.3,'markersize',7)
set(gca,'Fontname','Times New Roman','Fontsize',17);
xlabel('\fontname{宋体}迭代次数','FontSize',17)
% xlabel('Number of iterations','Fontname','Times New Roman','Fontsize',17)
ylabel('\fontname{宋体}模糊熵','FontSize',17)
xlim([1 10])
ylim([4e-05 4.5e-05])
set(gca,'xtick',[1:1:10]);
set(gca,'ytick',[4e-05:0.1e-05:4.5e-05]);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
hold on
plot(x2,'-bd','LineWidth',1.3,'markersize',7)
hold on
plot(x3,'-mv','LineWidth',1.3,'markersize',7)

h=legend('SMA','GA','PSO');
set(h,'Fontname','Times New Roman','Fontsize',14);
% set(h,'Box','off');