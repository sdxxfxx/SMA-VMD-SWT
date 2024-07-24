% ����˲����˥������
fid=fopen('t1000.txt');
fin=fopen('tem1000.txt');
t=cell2mat(textscan(fid,'%f64')); %  ʱ������ 
y=cell2mat(textscan(fin,'%f64')); %  ��Ÿ�Ӧ���� 
fclose(fid);
fclose(fin);


imf = emd(y);
[m,n]=size(imf);
y2=abs(y-imf(1,:)'-imf(2,:)'-imf(3,:)'-imf(4,:)');
save emd�����.txt -ascii y2

loglog(t,y,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,y2,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{����}����\fontname{Times New Roman}TEM\fontname{����}�ź�','\fontname{Times New Roman}EMD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
save emd�����.txt -ascii y2
%% ����
% ������˲����˥������
figure(2)
for i=1:5
subplot(5,1,i);
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
figure(3)
for i=6:9
subplot(4,1,i-5);
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
xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)


%% ŷʽ����ļ���
% c=(u(1,:)-x).^2;
% dist1=sqrt(sum(c(:)));
x=load('y1000.txt');
dist1=dist_E(x,imf(1,:));
disp (dist1)
dist2=dist_E(x,imf(2,:));
disp (dist2)
dist3=dist_E(x,imf(3,:));
disp (dist3)
dist4=dist_E(x,imf(4,:));
disp (dist4)
dist5=dist_E(x,imf(5,:));
disp (dist5)
dist6=dist_E(x,imf(6,:));
disp (dist6)
dist7=dist_E(x,imf(7,:));
disp (dist7)
dist8=dist_E(x,imf(8,:));
disp (dist8)
dist9=dist_E(x,imf(9,:));
disp (dist9)
% u=abs(u);
% save u.txt -ascii u
