clear, clc, close all;

%% input data
test = importdata('test.xlsx');
E = test(1,5);
L = test(1,6);
vertexs = test(:, 2:3);
customer = vertexs(2:end, :);
cusnum = size(customer, 1);
v_num = 1; % number of vehicle 当车辆数目大于1时，需要修改decode

a = test(2:end, 5); % tw, start time
b = test(2:end, 6); % tw, end time
s = test(2:end, 7); % service time 
% dist matrix
h = pdist(vertexs); 
dist = squareform(h);

%% GA parameters 
POP = 100; 
MAXGEN = 100; 
Pc = 0.9; 
Pm = 0.05; 
GGAP = 0.9; 
N = cusnum + v_num - 1;


%% initialize population 
init_vc = init(cusnum, a);

Chrom = InitPopCW(POP, N, cusnum, init_vc);

[VC,NV,TD,violate_num,violate_cus] = decode(Chrom(1,:),cusnum,a,b,L,s,dist);

ObjV = calObj(Chrom,cusnum,a,b,L,s,dist);
minObjV=min(ObjV)

%% the loop
gen = 0;
while gen <= MAXGEN
    % 计算适应度
    ObjV = calObj(Chrom,cusnum,a,b,L,s,dist);
    FitnV = Fitness(ObjV);
    % 选择
    SelCh = Select(Chrom,FitnV,GGAP);
    % crossover
    SelCh = Recombin(SelCh,Pc);
    % mutation
    SelCh = Mutate(SelCh,Pm);
    % 局部搜索
    SelCh = LocalSearch(SelCh, cusnum, a, b, L, s, dist);
    % 重新插入
    Chrom = Reins(Chrom,SelCh,ObjV);
    % 删除重复的个体
    Chrom = DealRepeat(Chrom);
    ObjV = calObj(Chrom,cusnum,a,b,L,s,dist);
    [minObjV,minInd]=min(ObjV);
    minObjV
    [bestVC,bestNV,bestTD,best_vionum,best_viocus]=decode(Chrom(minInd(1),:),cusnum,a,b,L,s,dist);
    gen = gen + 1;
end
ObjV = calObj(Chrom,cusnum,a,b,L,s,dist);
[minObjV,minInd]=min(ObjV);
minObjV





