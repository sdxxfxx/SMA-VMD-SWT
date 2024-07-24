t=load('t2000.txt');

% ��Ƶ����

y1=5*10^-5.*sin(2*pi*50.*t);
y2=5*10^-5.*sin(2*pi*100.*t);
y3=5*10^-5.*sin(2*pi*150.*t);       
y=y1+y2+y3;

figure (1)
subplot(3,1,1)
plot(t,y1,'color','b','LineWidth',1.2)
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off');
set(gca,'FontSize',17,'Fontname','Times New Roman'); 
set(gca,'xtick',[0:0.2:1]);
ylim([-1.5*10^-4 1.5*10^-4])
% set(gca,'position',[0.07 0.6 0.9 0.3]);
% ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',12,'FontWeight','bold','Fontname','Times New Roman'); 

subplot(3,1,2)
plot(t,y2,'color','b','LineWidth',1.2)
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off');
set(gca,'FontSize',17,'Fontname','Times New Roman'); 
set(gca,'xtick',[0:0.2:1]);
ylim([-1*10^-4 1*10^-4])
% set(gca,'position',[0.07 0.1 0.9 0.3]);
% xlabel('Time(s)','FontSize',12,'Fontname','Times New Roman','FontWeight','bold');
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 


subplot(3,1,3)
plot(t,y3,'color','b','LineWidth',1)
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off');
set(gca,'FontSize',17,'Fontname','Times New Roman'); 
set(gca,'xtick',[0:0.2:1]);
ylim([-1*10^-4 1*10^-4])
% set(gca,'position',[0.07 0.1 0.9 0.3]);
xlabel('Time/s','Fontname','Times New Roman','Fontsize',17,'FontWeight','bold')
% ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',12,'FontWeight','bold','Fontname','Times New Roman'); 

% figure (2)
% plot(t,y2,'color','b','LineWidth',1.2)
% set(gca,'xminortick','off'); %ȡ����ʾС�̶�
% set(gca,'yminortick','off'); %ȡ����ʾС�̶�
% xlabel('Time/s','Fontname','Times New Roman','Fontsize',17')
% ylabel('Impulse Response(V/A)','FontSize',17,'Fontname','Times New Roman'); 
% ylim([-1*10^-4 1*10^-4])
% set(gca,'FontSize',17,'Fontname','Times New Roman');
% set(gca,'linewidth');
% grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.5,'LineWidth',1);
% set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
% set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����

save gongpin2000.txt -ascii y