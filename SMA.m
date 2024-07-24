%%清空环境
clear all;

close all;

tic;
%%加载数据
F = load('tem1000.txt');

%%VMD参数设置
tau = 0;
DC = 0;
init = 1;
tol = 1e-5;

%%SMA参数寻优
N = 20; %菌群数量
Max_iter = 10; %最大迭代数次
dim = 2; %需要优化参数个数
lb = [5,1000];
ub = [10,5000];

disp('SMA is now tackling your problem')

% initialize position
bestPositions=zeros(1,dim);
Destination_fitness=inf;%change this to -inf for maximization problems

AllFitness = inf*ones(N,1);%记录黏菌所有适应度
% weight = ones(N,dim);
Convergence_curve=zeros(1,Max_iter);
%初始化随机解的集合

X=initialization(N,dim,ub,lb);
z=0.03; % parameter

it=1;  %Number of iterations
% Main loop
while  it <= Max_iter
    
    %对适应度进行排序
    for i=1:size(X,1)
        % 检查解决方案是否在搜索空间之外并将它们带回
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        K = round(X(i,1));
        alpha = round(X(i,2));
        
            
%     [SmellOrder,SmellIndex] = sort(AllFitness);  %Eq.(2.6)
%     worstFitness = SmellOrder(N);
%     bestFitness = SmellOrder(1);
%     S=bestFitness-worstFitness+eps;    
%     
%         for i=1:N
%           for j=1:dim
%             if i<=(N/2)  %Eq.(2.5)
%                 weight(SmellIndex(i),j) = 1+rand()*log10((bestFitness-SmellOrder(i))/(S)+1);
%             else
%                 weight(SmellIndex(i),j) = 1-rand()*log10((bestFitness-SmellOrder(i))/(S)+1);
%             end
%           end
%         end 
  
    %%计算适应度函数
        fitness(i) =fun(F,alpha,tau,K,DC,init,tol);

    %计算每个黏菌适应度重量
    
    %更新最佳适应度值和最佳位置
    if fitness(i) < Destination_fitness
        bestPositions= X(i,:);
        Destination_fitness = fitness(i);
        

    end
    
    a = atanh(-(it/Max_iter)+1);   %Eq.(2.4)
    b = 1-it/Max_iter;
    % 更新搜索代理位置
    for i=1:size(X,1)
        if rand<z     %Eq.(2.7)
            X(i,:) = (ub-lb)*rand+lb;
        else
            p =tanh(abs(AllFitness(i)-Destination_fitness));  %Eq.(2.2)
            vb = unifrnd(-a,a,1,dim);  %Eq.(2.3)
            vc = unifrnd(-b,b,1,dim);
         for j=1:size(X,2)
                r = rand();
                A = randi([1,N]);  % 从中群里随机选出两个位置
                B = randi([1,N]);
                if r<p    %Eq.(2.1)
                    X(i,j) = bestPositions(j) + vb(j)*(X(A,j)-X(B,j));
                else
                    X(i,j) = vc(j)*X(i,j);
                end
         end
         end
    end
    end   
    Convergence_curve(it)=Destination_fitness;
    it=it+1;
end

Best_pos = Destination_fitness;
Best_K = round(bestPositions(1,1));
Best_alpha = round(bestPositions(1,2));

disp('最优的惩罚系数和分解层数');
str=sprintf('Best K =%g,Best alpha = %g',Best_K,Best_alpha);
disp(str)

%%画图
figure(1)
hold on;
plot(Convergence_curve,'-rp','LineWidth',1.5)
% set(gca,'Fontname','Times New Roman');
xlabel('Number of iterations','Fontname','Times New Roman')
ylabel('FuzzyEn','Fontname','Times New Roman')
title('Convergence curve')
ylim([4.15e-05 4.2e-05])
grid on;set(gca,'GridLineStyle','--','GridColor','k','GridAlpha',0.4,'LineWidth',1);

toc;