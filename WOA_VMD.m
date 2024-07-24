%% ��ջ���
clc;
close all;
clear all;
tic;
%% ��������
X=load('x1000.txt');
N=length(X);    %���ݳ���

%% VMD��������
tau = 0;             % noise-tolerance (no strict fidelity enforcement) 0
DC = 1;              % no DC part imposed
init = 1;            % initialize omegas uniformly
tol = 1e-4;
%% WOA����Ѱ��
SearchAgents_no=50; 
Max_iteration=30;
lb = [3,1000];         % �ֽ����K�ͳͷ�ϵ��alpha������
ub = [15,15000];       % �ֽ����K�ͳͷ�ϵ��alpha������
dim = 2;              % Ҫ�Ż��Ĳ����������ֽ�����ͳͷ�ϵ����
Leader_pos=zeros(1,dim); %Ԥ��洢�ռ�
Leader_score=inf; %Ԥ��洢�ռ�
Positions=initialization(SearchAgents_no,dim,ub,lb);%��ʼ��������ϣ����30����ϣ�30,2��
Convergence_curve=zeros(1,Max_iteration); %Ԥ��洢�ռ�

t=0;% Loop counter

% Main loop
while t<Max_iteration
 
    for i=1:size(Positions,1)%��ÿ������һ��һ������Ƿ�Խ��
        
        % Return back the search agents that go beyond the boundaries of
        % the search space�����س��������ռ�߽����������
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        %�������ֵ�����ó����ֵ��������Сֵ�����ó���Сֵ
        
        K = round(Positions(i,1));       % �ֽ����
        alpha = round(Positions(i,2));   % �ͷ�ϵ��
        %c = ceil(Positions(i,1)));   % �ͷ�ϵ��c
        %g = ceil(Positions(i,2));  % �ֽ����g
        fitness(i)=fun(X,alpha,tau, K, DC, init, tol); %��Ӧ�Ⱥ��� �԰�������Сֵ��Ӧ��
                
        if fitness(i)<Leader_score % Change this to > for maximization problem
            Leader_score=fitness(i); % Update alpha
            Leader_pos=Positions(i,:);
        end
        
    end
    
    a=2-t*((2)/Max_iteration); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iteration);
    
    % Update the Position of search agents���������� 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)
        
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)%��ÿһ������ض�ά�Ƚ���ѭ������
            
            if p<0.5%������Χ���� 
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);%floor�� X ��ÿ��Ԫ���������뵽С�ڻ���ڸ�Ԫ�ص���ӽ�����
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5%��������λ��
              
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
                
            end
            
        end
         G(i)=fitness(i);
            
    end
    t=t+1;
    avgfitness(t) = sum(G)/SearchAgents_no;  %������Ӧ�ȵ�ƽ��ֵ
    Convergence_curve(t)=Leader_score;
   
end
Best_pos = Leader_score;
Best_K = round(Leader_pos(1,1));
Best_alpha = round(Leader_pos(1,2));

disp('���ŵĳͷ�ϵ���ͷֽ����');
str=sprintf('Best alpha = %g��Best K = %g',Best_alpha,Best_K);
disp(str)
%% ��ͼ
figure
hold on;
plot(Convergence_curve,'r-*','LineWidth',1.5)
% plot(avgfitness,'o-','LineWidth',1.5)
xlabel('��������','fontsize',12);
ylabel('��Ӧ��ֵ','fontsize',12);
% legend('�����Ӧ��','ƽ����Ӧ��',3);
title('WOA-VMD��Ӧ������')
grid on;
toc;