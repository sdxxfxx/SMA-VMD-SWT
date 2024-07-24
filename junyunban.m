clear 
clc 
tic 
format long 
fid=fopen('t1000.txt');
fin=fopen('Hankel140.txt');
fie=fopen('G-S.txt');
mu0=6*pi*10^(-7); 
L=100; cs=1; s=1200; zs=4;cur=9;% LΪ������Ȧ�߳�����λm����csΪ������
% sΪ������Ȧ�������λm2����zsΪ������Ȧ������cur����ǿ��
p=50;    %  ���������
h=inf;    %  ������ 
t=cell2mat(textscan(fid,'%f64')); %  ʱ������ 
W1=cell2mat(textscan(fin,'%f64'));% 140�㺺�˶������˲�ϵ��
W2=cell2mat(textscan(fie,'%f64'));% 12��G-S�����ϱ任�˲�ϵ��   
fclose(fid);
fclose(fin);
fclose(fie);
Lmd=zeros(1,140);%ʹ��zeros������ͨ��Ԥ����������������ռ������̴���ִ��ʱ�䡣
ps1=zeros(1,1000);
ps2=zeros(1,1000);
for m=1:140 
      Lmd(m)=(sqrt(pi)/L)*10^(-7.91001919000+(m-1)*0.0879671439570);   % LmdΪ��m 
      
end 
for k=1:length(t) 
     tt=t(k); 
     for j=cs:-1:1 
         for n=1:12 
             for m=1:140 
                 z0(n,m)=-log(2)*n*mu0/(Lmd(m)*tt); 
                 u((j-1)*12+n,m)=sqrt(Lmd(m)^2+log(2)*n*mu0/(p(j)*tt)); 
                 z((j-1)*12+n,m)=-log(2)*n*mu0/(u((j-1)*12+n,m)*tt); 
                 if j==cs 
                     zz(n,m)=z((j-1)*12+n,m); 
                 end 
             end 
         end 
     end 
     
     for j=cs-1:-1:1 
         for n=1:12 
             for m=1:140 
                 if j>1 
                     u1=u((j-1)*12+n,m);z1=z((j-1)*12+n,m); 
                     zz(n,m)=z1*(zz(n,m)+z1*tanh(u1*h(j)))/(z1+zz(n,m)*tanh(u1*h(j))); 
                 end 
             end 
         end 
     end 
     RM=0; 
     for n=1:12 
         LM=0; 
         for m=1:140 
             LM=LM+Lmd(m)*W1(m)*((zz(n,m)/(zz(n,m)+z0(n,m)))-0.5); 
         end 
         RM=RM+(LM+sqrt(pi)/L*tt/(2*log(2)*n))*W2(n); 
         RM=RM+LM*W2(n); 
     end 
     
     gy=s*zs*cur*mu0*log(2)*RM/tt;   %  ��Ӧ�綯��  
      ps=0.00632*L^(4/3)*s^(2/3)*(((1000000*gy)/cur)^(-2/3))*(1000*tt)^(-5/3);   %  �����ӵ����ʹ�ʽ 
     ps1(k)=ps; 
     ps2(k)=gy;  
  
end 
loglog(t,ps2,'color','b','LineWidth',1.3) 
set(gca,'xminortick','off'); %ȡ����ʾС�̶�
set(gca,'yminortick','off'); %ȡ����ʾС�̶�
xlabel('\fontname{����}ʱ��/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V��A^-^1��m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
% h=legend('Oringal signal');
%  set(h,'Fontname','Times New Roman','Fontsize',15);
%  set(h,'Box','off');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %�ر�y���ϵ�С����
set(gca,'xminorgrid','off'); %�ر�x���ϵ�С����
toc 
save y1000.txt -ascii ps2 