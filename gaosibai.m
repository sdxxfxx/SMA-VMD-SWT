clear;clc;
y = load('y1000.txt');
t = load('time1000.txt');
Nx=1000;
x1 = normrnd(0.000002,0.0006,1,1000);
% x1 = 0.2*wgn(1,Nx,-55);%y = wgn(m,n,p) ����һ��m��n�еĸ�˹�������ľ���p��dBWΪ��λָ�����������ǿ�ȡ�
y = x1+y;

figure (1)

plot(t,x1,'color','b','LineWidth',1.2)
set(gca,'FontSize',17,'Fontname','Times New Roman'); 
set(gca,'xtick',[0:0.2:1]);
% set(gca,'position',[0.07 0.6 0.9 0.3]);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off');
xlabel('Time/s','Fontname','Times New Roman','Fontsize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
save gaosibai1000.txt -ascii x1