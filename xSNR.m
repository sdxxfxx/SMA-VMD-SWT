X = load('y1000.txt');              %原信号
Y1 = load('emd降噪后.txt');
Y2 = load('wtd降噪后.txt');
Y3 = load('vmd降噪后.txt');

%emd信噪比
Y1=Y1';
y=X(400:1000);
A1=sum(Y1.^2);
B1=sum((Y1-X).^2);
b1=10*log10(A1/B1);
                     % snr(a,b) : a是原始信号，b是噪声信号
 
%wtd信噪比
x2=Y2(400:1000);
A2=sum(x2.^2);
B2=sum((x2-y).^2);
b2=10*log10(A2/B2);
                       % snr(a,b) : a是原始信号，b是噪声信号

%vmd信噪比
x3=Y3(400:1000);
A3=sum(x3.^2);
B3=sum((x3-y).^2);
b3=10*log10(A3/B3);
                        % snr(a,b) : a是原始信号，b是噪声信号
                        
rmse1 = sqrt(mean((Y1-X).^2));
rmse2 = sqrt(mean((x2-y).^2));
rmse3 = sqrt(mean((x3-y).^2));

