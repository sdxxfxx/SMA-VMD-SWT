%% ��ջ�������
clc
clear
close all

X=load('tem1000.txt');   % ����
x=load('y1000.txt');
t=load('t1000.txt');
T=1000;


%% VMD �ֽ��������
alpha =2000;        % 2000 moderate bandwidth constraint �ͷ�����
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0 �������̶�
K =7;                % 3 VMD�ֽ������������Ҫ�˹�����
DC = 1;              % no DC part imposed
init = 0;            % initialize omegas uniformly����Ƶ�ʳ�ʼ��
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

h1=u(1,:);
figure(1)

loglog(t,X,'b','linewidth',1.2) %-rp ��ɫ�����
hold on
loglog(t,h1,'color','r','linewidth',1.2)%12
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');

h=legend('\fontname{����}����\fontname{Times New Roman}TEM\fontname{����}�ź�','\fontname{Times New Roman}VMD-SWT');
set(h,'Fontsize',15);

% set(h,'Box','off');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
save vmd�����.txt -ascii h1



