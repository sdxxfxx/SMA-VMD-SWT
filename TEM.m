t1=load('time1000.txt');
t2=load('t1000.txt');

x=load('y1000.txt');

y1=load('gaosibai1000.txt');
y2=load('gongpin1000.txt');
y=x+y1+y2;
yy=y1+y2;
Fs=1000;
N=1000;
c1=fft(y);       %进行快速傅里叶变换FFT
mag1=abs(c1);     %求取振幅
s1=0:length(c1)-1;
f1=Fs*s1/length(c1); %求取频率
% y1=y1';


figure (1)
plot(t1,yy,'color','b','LineWidth',1.3);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('Time/s','Fontname','Times New Roman','Fontsize',17')
ylabel('Impulse Response(V/A)','FontSize',17,'Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格

figure(2)
loglog(t2,y,'color','b','LineWidth',1.3);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格

save tem1000.txt -ascii y

