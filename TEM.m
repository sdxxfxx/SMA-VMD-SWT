t1=load('time1000.txt');
t2=load('t1000.txt');

x=load('y1000.txt');

y1=load('gaosibai1000.txt');
y2=load('gongpin1000.txt');
y=x+y1+y2;
yy=y1+y2;
Fs=1000;
N=1000;
c1=fft(y);       %���п��ٸ���Ҷ�任FFT
mag1=abs(c1);     %��ȡ���
s1=0:length(c1)-1;
f1=Fs*s1/length(c1); %��ȡƵ��
% y1=y1';


figure (1)
plot(t1,yy,'color','b','LineWidth',1.3);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('Time/s','Fontname','Times New Roman','Fontsize',17')
ylabel('Impulse Response(V/A)','FontSize',17,'Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����

figure(2)
loglog(t2,y,'color','b','LineWidth',1.3);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����

save tem1000.txt -ascii y

