clear 
clc 
tic 
format long 
fid=fopen('t1000.txt');
fin=fopen('Hankel140.txt');
fie=fopen('G-S.txt');
mu0=6*pi*10^(-7); 
L=100; cs=1; s=1200; zs=4;cur=9;% L为发射线圈边长（单位m），cs为层数，
% s为接收线圈面积（单位m2），zs为接收线圈匝数，cur电流强度
p=50;    %  各层电阻率
h=inf;    %  各层厚度 
t=cell2mat(textscan(fid,'%f64')); %  时间序列 
W1=cell2mat(textscan(fin,'%f64'));% 140点汉克尔数字滤波系数
W2=cell2mat(textscan(fie,'%f64'));% 12点G-S逆拉氏变换滤波系数   
fclose(fid);
fclose(fin);
fclose(fie);
Lmd=zeros(1,140);%使用zeros函数，通过预分配阵列所需的最大空间来缩短代码执行时间。
ps1=zeros(1,1000);
ps2=zeros(1,1000);
for m=1:140 
      Lmd(m)=(sqrt(pi)/L)*10^(-7.91001919000+(m-1)*0.0879671439570);   % Lmd为λm 
      
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
     
     gy=s*zs*cur*mu0*log(2)*RM/tt;   %  感应电动势  
      ps=0.00632*L^(4/3)*s^(2/3)*(((1000000*gy)/cur)^(-2/3))*(1000*tt)^(-5/3);   %  晚期视电阻率公式 
     ps1(k)=ps; 
     ps2(k)=gy;  
  
end 
loglog(t,ps2,'color','b','LineWidth',1.3) 
set(gca,'xminortick','off'); %取消显示小刻度
set(gca,'yminortick','off'); %取消显示小刻度
xlabel('\fontname{宋体}时间/\fontname{Times New Roman}s','FontSize',17,'FontWeight','bold')
ylabel('{\itU}/(V·A^-^1·m^-^2)','FontSize',17,'FontWeight','bold','Fontname','Times New Roman'); 
set(gca,'FontSize',17,'Fontname','Times New Roman');
set(gca,'linewidth');
% h=legend('Oringal signal');
%  set(h,'Fontname','Times New Roman','Fontsize',15);
%  set(h,'Box','off');
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);
set(gca,'yminorgrid','off'); %关闭y轴上的小网格
set(gca,'xminorgrid','off'); %关闭x轴上的小网格
toc 
save y1000.txt -ascii ps2 