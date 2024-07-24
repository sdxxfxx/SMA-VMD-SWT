% 理想瞬变电磁衰减曲线
fid=fopen('t1000.txt');
fin=fopen('tem1000.txt');
t=cell2mat(textscan(fid,'%f64')); %  时间序列 
y=cell2mat(textscan(fin,'%f64')); %  电磁感应数据 
fclose(fid);
fclose(fin);


imf = emd(y);
[m,n]=size(imf);
y2=abs(y-imf(1,:)'-imf(2,:)'-imf(3,:)'-imf(4,:)');
save emd降噪后.txt -ascii y2

loglog(t,y,'b','linewidth',1.2) %-rp 红色五角星
hold on
loglog(t,y2,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{宋体}含噪\fontname{Times New Roman}TEM\fontname{宋体}信号','\fontname{Times New Roman}EMD');
set(h,'Fontsize',15);
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
save emd降噪后.txt -ascii y2
%% 分量
% 含干扰瞬变电磁衰减曲线
figure(2)
for i=1:5
subplot(5,1,i);
semilogx(t,imf(i,:),'b-','linewidth',1.3)
ylabel(['IMF',int2str(i)],'FontSize',14,'Fontname','Times New Roman');
set(gca,'FontSize',14,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
end;
% xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)
figure(3)
for i=6:9
subplot(4,1,i-5);
semilogx(t,imf(i,:),'b-','linewidth',1.3)
ylabel(['IMF',int2str(i)],'FontSize',14,'Fontname','Times New Roman');
set(gca,'FontSize',14,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
end;
xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)


%% 欧式距离的计算
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
