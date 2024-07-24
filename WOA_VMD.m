%% 清空环境
clc;
close all;
clear all;
tic;
%% 加载数据
X=load('x1000.txt');
N=length(X);    %数据长度

%% VMD参数设置
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0
DC = 1;              % no DC part imposed
init = 1;            % initialize omegas uniformly
tol = 1e-4;
%% WOA参数寻优
SearchAgents_no=50; 
Max_iteration=30;
lb = [3,1000];         % 分解层数K和惩罚系数alpha的下限
ub = [15,15000];       % 分解层数K和惩罚系数alpha的上限
dim = 2;              % 要优化的参数个数（分解层数和惩罚系数）
Leader_pos=zeros(1,dim); %预设存储空间
Leader_score=inf; %预设存储空间
Positions=initialization(SearchAgents_no,dim,ub,lb);%初始化参数组合，获得30组组合（30,2）
Convergence_curve=zeros(1,Max_iteration); %预设存储空间

t=0;% Loop counter

% Main loop
while t<Max_iteration
 
    for i=1:size(Positions,1)%对每个个体一个一个检查是否越界
        
        % Return back the search agents that go beyond the boundaries of
        % the search space，返回超出搜索空间边界的搜索代理
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        %超过最大值的设置成最大值，超过最小值的设置成最小值
        
        K = round(Positions(i,1));       % 分解层数
        alpha = round(Positions(i,2));   % 惩罚系数
        %c = ceil(Positions(i,1)));   % 惩罚系数c
        %g = ceil(Positions(i,2));  % 分解层数g
        fitness(i)=fun(X,alpha,tau, K, DC, init, tol); %适应度函数 以包络熵最小值适应度
                
        if fitness(i)<Leader_score % Change this to > for maximization problem
            Leader_score=fitness(i); % Update alpha
            Leader_pos=Positions(i,:);
        end
        
    end
    
    a=2-t*((2)/Max_iteration); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iteration);
    
    % Update the Position of search agents，参数更新 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)
        
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)%对每一个个体地多维度进行循环运算
            
            if p<0.5%收缩包围机制 
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);%floor将 X 的每个元素四舍五入到小于或等于该元素的最接近整数
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5%螺旋更新位置
              
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
                
            end
            
        end
         G(i)=fitness(i);
            
    end
    t=t+1;
    avgfitness(t) = sum(G)/SearchAgents_no;  %计算适应度的平均值
    Convergence_curve(t)=Leader_score;
   
end
Best_pos = Leader_score;
Best_K = round(Leader_pos(1,1));
Best_alpha = round(Leader_pos(1,2));

disp('最优的惩罚系数和分解层数');
str=sprintf('Best alpha = %g，Best K = %g',Best_alpha,Best_K);
disp(str)
%% 画图
figure
hold on;
plot(Convergence_curve,'r-*','LineWidth',1.5)
% plot(avgfitness,'o-','LineWidth',1.5)
xlabel('进化代数','fontsize',12);
ylabel('适应度值','fontsize',12);
% legend('最佳适应度','平均适应度',3);
title('WOA-VMD适应度曲线')
grid on;
toc;