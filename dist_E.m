function dist = dist_E(x,y)
dist = [];
if(length(x)~=length(y))
    disp('length of input vectors must agree')  % disp������ֱ�ӽ����������Matlab�������
else
    z =(x-y).*(x-y);
    dist = sqrt(sum(z));
end
end
