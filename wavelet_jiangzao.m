X=load('tem1000.txt');   % ����
x=load('y1000.txt');
t=load('t1000.txt');

% ������˲����˥������

s1=wden(X,'rigrsure','s','one',5,'sym6');


save wtd�����.txt -ascii s1

figure
loglog(t,X,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,s1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
h=legend('\fontname{����}����\fontname{Times New Roman}TEM\fontname{����}�ź�','\fontname{Times New Roman}WTD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����