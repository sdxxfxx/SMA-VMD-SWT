X=xlsread('C:\Users\Administrator\Desktop\论文三\数据\原始数据处理.xlsx','sheet1','a1:a1000');  % 数据
% x=load('y1000.txt');
t=load('t1000.txt');

% 含干扰瞬变电磁衰减曲线

s1=abs(wden(X,'rigrsure','h','one',4,'sym5'));


save wtd1降噪后17.txt -ascii s1

figure
loglog(t,X,'b','linewidth',1.2) %-rp 红色五角星
hold on
loglog(t,s1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{宋体}实测含噪信号','\fontname{Times New Roman}WTD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格