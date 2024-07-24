% ����˲����˥������


y=xlsread('C:\Users\Administrator\Desktop\������\����\ԭʼ���ݴ���.xlsx','sheet1','a1:a1000');
t=load('t1000.txt');
imf = emd(y);
[m,n]=size(imf);
y2=abs(y-imf(1,:)'-imf(2,:)'-imf(3,:)'-imf(4,:)');
save emd�����17.txt -ascii y2

loglog(t,y,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,y2,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{����}ʵ�⺬���ź�','\fontname{Times New Roman}EMD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����

%% ����
% ������˲����˥������
figure(2)
for i=1:m
subplot(m,1,i);
semilogx(t,imf(i,:),'b-','linewidth',1.3)
ylabel(['IMF',int2str(i)],'FontSize',14,'Fontname','Times New Roman');
set(gca,'FontSize',14,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
end;
% xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)
% figure(3)
% for i=6:9
% subplot(4,1,i-5);
% semilogx(t,imf(i,:),'b-','linewidth',1.3)
% ylabel(['IMF',int2str(i)],'FontSize',14,'Fontname','Times New Roman');
% set(gca,'FontSize',14,'Fontname','Times New Roman');
% set(gca,'linewidth',1);
% set(gca,'xminortick','off'); %ȡ����ʾС�̶�
% set(gca,'yminortick','off'); %ȡ����ʾС�̶�
% grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
% set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
% set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
% end;
% xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)



