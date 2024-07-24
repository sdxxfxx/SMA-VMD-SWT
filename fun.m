function fitness = fun(X,c,tau,g,DC,init,tol)%对信号进行VMD分解
alpha =c;
K = g;
[u, ~, ~] = VMD(X, alpha, tau, K, DC, init, tol);
[m,~] = size(u);
% 排列熵
% for i = 1:m
%     [pe hist] = pec(u(i,:),4,4);
%     P_VMD(i) = pe;
% end

for i = 1:m
    fuzzyen = Fuzzy_Entropy(2,0.2,u(i,:),1);
    P_VMD(i) = fuzzyen;

end
P_total = sum(P_VMD);

disp (P_total)
fitness = P_total;


% 
% 能量熵
% for i = 1:m;
%     E_VMD(i)=sum(u(i,:).^2);
% end;
% E_total = sum(E_VMD);
% for j = 1:m;
%     p(j) = E_VMD(j)/E_total;
%     E(j) = -p(j).*log(p(j));
% end;
% fitniss = min(E);
    