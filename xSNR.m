X = load('y1000.txt');              %ԭ�ź�
Y1 = load('emd�����.txt');
Y2 = load('wtd�����.txt');
Y3 = load('vmd�����.txt');

%emd�����
Y1=Y1';
y=X(400:1000);
A1=sum(Y1.^2);
B1=sum((Y1-X).^2);
b1=10*log10(A1/B1);
                     % snr(a,b) : a��ԭʼ�źţ�b�������ź�
 
%wtd�����
x2=Y2(400:1000);
A2=sum(x2.^2);
B2=sum((x2-y).^2);
b2=10*log10(A2/B2);
                       % snr(a,b) : a��ԭʼ�źţ�b�������ź�

%vmd�����
x3=Y3(400:1000);
A3=sum(x3.^2);
B3=sum((x3-y).^2);
b3=10*log10(A3/B3);
                        % snr(a,b) : a��ԭʼ�źţ�b�������ź�
                        
rmse1 = sqrt(mean((Y1-X).^2));
rmse2 = sqrt(mean((x2-y).^2));
rmse3 = sqrt(mean((x3-y).^2));

