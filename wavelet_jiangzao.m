X=xlsread('C:\Users\Administrator\Desktop\������\����\ԭʼ���ݴ���.xlsx','sheet1','a1:a1000');  % ����
% x=load('y1000.txt');
t=load('t1000.txt');

% ������˲����˥������

s1=abs(wden(X,'rigrsure','h','one',4,'sym5'));


save wtd1�����17.txt -ascii s1

figure
loglog(t,X,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,s1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{����}ʵ�⺬���ź�','\fontname{Times New Roman}WTD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����