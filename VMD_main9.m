%% ��ջ�������
clc
clear
close all

X=xlsread('C:\Users\Administrator\Desktop\������\����\ԭʼ���ݴ���.xlsx','sheet1','a1:a1000');
% x=load('y1000.txt');
t=load('t1000.txt');
T=1000;


%% VMD �ֽ��������
alpha =1000;        % 2000 moderate bandwidth constraint �ͷ�����
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0 �������̶�
K =8;                % 3 VMD�ֽ������������Ҫ�˹�����
DC = 1;              % no DC part imposed
init = 1;            % initialize omegas uniformly����Ƶ�ʳ�ʼ��
tol = 1e-4;
% ��������

%% �����źų��ȺͲ���Ƶ������
Fs=1000;            %����Ƶ��
N=length(X);        %���ݳ���
freqs = 2*pi*(t-0.5-1/T)*(Fs);
f_hat = fftshift((fft(X)));

%% VMD�ֽ�
[u, u_hat, omega] = VMD(X, alpha, tau, K, DC, init, tol);
%u      -�ֽ�õ��ķ�����
%u_hat  -ģ̬��Ƶ��
%omega  -����Ƶ�ʹ���ֵ
[~, sortIndex] = sort(omega(end,:));
u_hat = u_hat(:,sortIndex);
omega1=omega*Fs; %����Ƶ�ʣ�������Լ��������Ҳ��Workspace
[m,n]=size(u); %% ����u��ά��

h1=u(1,:);
figure(1)

loglog(t,X,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,h1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',14.5,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{����}ʵ�⺬���ź�','\fontname{Times New Roman}VMD-SWT');
set(h,'Fontsize',15);

% set(h,'Box','off');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
save vmd�����.txt -ascii h1

%% ʱ��ͼ
figure(2)
for i=1:m
subplot(m,1,i);
semilogx(t,u(i,:),'b-','linewidth',1.3)
ylabel(['IMF',int2str(i)],'FontSize',17,'Fontname','Times New Roman');
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
end;
xlabel('Time/(s)','Fontname','Times New Roman','Fontsize',17)

%% Ƶ��ͼ
figure (3)
for i=1:m
c(i,:)=fft(u(i,:));       %���п��ٸ���Ҷ�任FFT   
mag=abs(c(i,:));          %��ȡ���
s=(0:length(c(i,:))-1)*Fs/N;
p=s(1:N/2);
q3=mag(1:N/2)*2/N;
subplot(m,1,i)
h(i)=plot(p,q3,'b-','linewidth',1.3);
ylabel(['IMF',int2str(i)],'FontSize',17,'Fontname','Times New Roman');
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth',1);
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
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
