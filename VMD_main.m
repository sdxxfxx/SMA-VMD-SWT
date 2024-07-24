%% ��ջ�������
clc
clear
close all

X=load('tem1000.txt');   % ����
x=load('y1000.txt');
t=load('t1000.txt');
T=1000;

% X=x+x1'+x2;
% X=abs(X);
% X=load('tem2000.txt');   % ����
% x=load('y2000.txt');
% t=load('t2000.txt');

%% VMD �ֽ��������
alpha =2000;        % 2000 moderate bandwidth constraint �ͷ�����
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0 �������̶�
K =4;                % 3 VMD�ֽ������������Ҫ�˹�����
DC = 1;              % no DC part imposed
init = 1;            % initialize omegas uniformly����Ƶ�ʳ�ʼ��
tol = 1e-5;
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
