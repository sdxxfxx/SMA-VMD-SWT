% 理想瞬变电磁衰减曲线
fid=fopen('t1000.txt');
fin=fopen('tem1000.txt');
t=cell2mat(textscan(fid,'%f64')); %  时间序列 
y=cell2mat(textscan(fin,'%f64')); %  电磁感应数据 
fclose(fid);
fclose(fin);

Fs=1000;            %采样频率
N=length(X);        %数据长度
freqs = 2*pi*(t-0.5-1/T)*(Fs);
f_hat = fftshift((fft(X)));

imf = emd(y);
[m,n]=size(imf);
figure
for i=1:5
c(i,:)=fft(imf(i,:));       %进行快速傅里叶变换FFT   
mag=abs(c(i,:));          %求取振幅
s=(0:length(c(i,:))-1)*Fs/N;
p=s(1:N/2);
q3=mag(1:N/2)*2/N;
subplot(5,1,i)
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
figure
for i=6:9
c(i,:)=fft(imf(i,:));       %进行快速傅里叶变换FFT   
mag=abs(c(i,:));          %求取振幅
s=(0:length(c(i,:))-1)*Fs/N;
p=s(1:N/2);
q3=mag(1:N/2)*2/N;
subplot(4,1,i-5)
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
