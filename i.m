t=load('t1000.txt');
y=xlsread('C:\Users\Administrator\Desktop\������\����\ԭʼ���ݴ���.xlsx','sheet1','a1:a1000');
y1=load('vmd�����.txt');
y2=load('emd�����.txt');
y3=load('wtd1�����.txt');

loglog(t,y,'b','linewidth',1.2) %-rp ��ɫ�����
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
hold on
loglog(t,y2,'Color',[1 0.64706 0],'linewidth',1.5) %-rp ��ɫ�����
hold on
loglog(t,y3,'Color',[0.19608 0.80392 0.19608],'linewidth',1.5) %-rp ��ɫ�����
hold on
loglog(t,y1,'r','linewidth',1.5) %-rp ��ɫ�����
% set(gca, 'XtickLabel', {'10^(-5)', '10^(-4)', '10^(-3)', '10^(-3)', '10^(-2)','10^(-1)','10^(0)'});
% set(gca,'XTick',[10^(-5):10^(-1)])
% xlim([10^(-5) 10^(-1)])

h=legend('\fontname{����}ʵ��','\fontname{Times New Roman}EMD','\fontname{Times New Roman}WTD','\fontname{Times New Roman}VMD-SWT','Location','NorthWest');
set(h,'Fontname','Times New Roman','Fontsize',13);
grid on;
set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
% hold on
% loglog(t,y,'color','r','linewidth',1.2)%12

figure (2)
loglog(t,y2,'Color',[1 0.64706 0],'linewidth',1.5) %-rp ��ɫ�����
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
hold on
loglog(t,y3,'Color',[0.19608 0.80392 0.19608],'linewidth',1.5) %-rp ��ɫ�����
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
hold on
loglog(t,y1,'r','linewidth',1.5)
xlim([10^(-2) 10^(-1)])
ylim([10^(-4.2) 10^(-3.5)])
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
% xlabel('Time/s','Fontname','Times New Roman','Fontsize',15)
% ylabel('Impulse Response(V/A)','Fontname','Times New Roman','Fontsize',15)
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gca,'linewidth',1.2)
set(0,'defaultfigurecolor','w')
set(gcf,'unit','centimeters','position',[11 7 5.3 4.2])

% ylim([10^(-4.2) 10^(-3.5)])
