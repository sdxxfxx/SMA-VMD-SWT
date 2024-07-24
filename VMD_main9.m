%% 清空环境变量
clc
clear
close all

X=xlsread('C:\Users\Administrator\Desktop\论文三\数据\原始数据处理.xlsx','sheet1','a1:a1000');
% x=load('y1000.txt');
t=load('t1000.txt');
T=1000;


%% VMD 分解参数设置
alpha =1000;        % 2000 moderate bandwidth constraint 惩罚因子
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0 噪声容忍度
K =8;                % 3 VMD分解个数，这里需要人工设置
DC = 1;              % no DC part imposed
init = 1;            % initialize omegas uniformly中心频率初始化
tol = 1e-4;
% 加载数据

%% 数据信号长度和采样频率设置
Fs=1000;            %采样频率
N=length(X);        %数据长度
freqs = 2*pi*(t-0.5-1/T)*(Fs);
f_hat = fftshift((fft(X)));

%% VMD分解
[u, u_hat, omega] = VMD(X, alpha, tau, K, DC, init, tol);
%u      -分解得到的分量集
%u_hat  -模态的频谱
%omega  -中心频率估计值
[~, sortIndex] = sort(omega(end,:));
u_hat = u_hat(:,sortIndex);
omega1=omega*Fs; %中心频率，这里可以见主界面右侧的Workspace
[m,n]=size(u); %% 分量u的维数

h1=u(1,:);
figure(1)

loglog(t,X,'b','linewidth',1.2) %-rp 红色五角星
hold on
loglog(t,h1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{宋体}实测含噪信号','\fontname{Times New Roman}VMD-SWT');
set(h,'Fontsize',15);

% set(h,'Box','off');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
save vmd降噪后.txt -ascii h1

%% 时域图
figure(2)
for i=1:m
subplot(m,1,i);
semilogx(t,u(i,:),'b-','linewidth',1.3)
ylabel(['IMF',int2str(i)],'FontSize',17,'Fontname','Times New Roman');
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
end;
xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)

%% 频谱图
figure (3)
for i=1:m
c(i,:)=fft(u(i,:));       %进行快速傅里叶变换FFT   
mag=abs(c(i,:));          %求取振幅
s=(0:length(c(i,:))-1)*Fs/N;
p=s(1:N/2);
q3=mag(1:N/2)*2/N;
subplot(m,1,i)
h(i)=plot(p,q3,'b-','linewidth',1.3);
ylabel(['IMF',int2str(i)],'FontSize',17,'Fontname','Times New Roman');
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
set(gca,'xtick',[0:100:500]);
% ylim([0 1e-04])
end;
xlabel('Frequency/(Hz)','Fontname','Times New Roman','Fontsize',17)

figure (4)
semilogx(t,u(1,:),'b-','linewidth',1.3)
xlim([10^(-4) 10^(-3)])
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[11 7 4.1 2.2])


figure (5)
semilogx(t,u(2,:),'b-','linewidth',1.3)
xlim([10^(-4) 10^(-3)])
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[11 7 4.1 2.2])


figure (6)
semilogx(t,u(3,:),'b-','linewidth',1.3)
xlim([10^(-4) 10^(-3)])
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[11 7 4.1 2.2])


figure (7)
semilogx(t,u(4,:),'b-','linewidth',1.3)
xlim([10^(-4) 10^(-3)])
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[11 7 4.1 2.2])


figure (8)
semilogx(t,u(5,:),'b-','linewidth',1.3)
xlim([10^(-4) 10^(-3)])
set(gca,'FontSize',13,'Fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[11 7 4.1 2.2])
