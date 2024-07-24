t=load('t1000.txt');
y=xlsread('C:\Users\Administrator\Desktop\论文三\数据\原始数据处理.xlsx','sheet1','a1:a1000');
y1=load('vmd降噪后.txt');
y2=load('emd降噪后.txt');
y3=load('wtd1降噪后.txt');

loglog(t,y,'b','linewidth',1.2) %-rp 红色五角星
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
hold on
loglog(t,y2,'Color',[1 0.64706 0],'linewidth',1.5) %-rp 红色五角星
hold on
loglog(t,y3,'Color',[0.19608 0.80392 0.19608],'linewidth',1.5) %-rp 红色五角星
hold on
loglog(t,y1,'r','linewidth',1.5) %-rp 红色五角星
% set(gca, 'XtickLabel', {'10^(-5)', '10^(-4)', '10^(-3)', '10^(-3)', '10^(-2)','10^(-1)','10^(0)'});
% set(gca,'XTick',[10^(-5):10^(-1)])
% xlim([10^(-5) 10^(-1)])

h=legend('\fontname{宋体}实测','\fontname{Times New Roman}EMD','\fontname{Times New Roman}WTD','\fontname{Times New Roman}VMD-SWT','Location','NorthWest');
set(h,'Fontname','Times New Roman','Fontsize',13);
grid on;
set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
% hold on
% loglog(t,y,'color','r','linewidth',1.2)%12

figure (2)
loglog(t,y2,'Color',[1 0.64706 0],'linewidth',1.5) %-rp 红色五角星
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
hold on
loglog(t,y3,'Color',[0.19608 0.80392 0.19608],'linewidth',1.5) %-rp 红色五角星
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
hold on
loglog(t,y1,'r','linewidth',1.5)
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
% xlabel('Time/s','Fontname','Times New Roman','Fontsize',15)
% ylabel('Impulse Response(V/A)','Fontname','Times New Roman','Fontsize',15)
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gca,'linewidth',1.2)
set(0,'defaultfigurecolor','w')
set(gcf,'unit','centimeters','position',[11 7 5.3 4.2])

% ylim([10^(-4.2) 10^(-3.5)])
