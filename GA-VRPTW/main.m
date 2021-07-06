clear, clc, close all;

%% input data
% test_date = importdata('test.xlsx');
test_date = importdata('c101.txt');
% tw1 means the earliest start time, tw2 means the latest start time
depot_time_window1 = test_date(1,5);
depot_time_window2 = test_date(1,6);
time_window1 = test_date(2:end, 5); % tw, start time
time_window2 = test_date(2:end, 6); % tw, end time
service_time = test_date(2:end, 7); % service time 
vertexs = test_date(:, 2:3);
customer_location = vertexs(2:end, :);
customer_number = size(customer_location, 1);

robot_number = 4; % number of vehicles

% dist matrix
distance_pair = pdist(vertexs); % pairwise distance
distance_matrix = squareform(distance_pair); 

%% GA parameters 
population = 100; 
generation = 1;
maximum_generation = 3; 
probability_crossover = 0.9; 
probability_mutation = 0.05; 
rate_gap = 0.9; 
length_chrom = customer_number + robot_number - 1;

%% initialize population
init_chrom = createInitChrom(customer_number, time_window1);

chroms = createInitPopulation(population, length_chrom, customer_number, init_chrom);

% display some values of the initial random population
[VC,NV,TD,violate_num,violate_cus] = decode(chroms(1,:),customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
disp('The initial population:');
disp(['Number of Robots: ', num2str(NV), ', Total Distance: ', num2str(TD), ', Number of violated Path: ', num2str(violate_num), ', Number of Violated Customer: ', num2str(violate_cus)]);
fprintf('\n');
ObjV = calObj(chroms,customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
pre_objective_value=min(ObjV);

% Display the change of the objective function value
figure;
hold on;
box on;
xlim([0, maximum_generation]);
title('Optimization Process');
xlabel('Generation');
ylabel('The Optimal Value');
%% the loop
while generation <= maximum_generation
    % calculate the fitness value
    ObjV = calObj(chroms,customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
    % draw the line
    line([generation - 1, generation], [pre_objective_value, min(ObjV)]); pause(0.0001);
    pre_objective_value = min(ObjV);
    FitnV = Fitness(ObjV);
    % select
    SelCh = Select(chroms,FitnV,rate_gap);
    % crossover
    SelCh = Recombin(SelCh,probability_crossover);
    % mutation
    SelCh = Mutate(SelCh,probability_mutation);
    
    
    % local search
    SelCh = neighborhoodSearch(SelCh, customer_number, time_window1, time_window2, depot_time_window2, service_time, distance_matrix);
    % 
    chroms = Reins(chroms,SelCh,ObjV);
    % Delete duplicate chromsomes 
    chroms = DealRepeat(chroms);
    ObjV = calObj(chroms,customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
    [minObjV,minInd]=min(ObjV);
    disp(['Generation:' num2str(generation)]);
    [bestVC,bestNV,bestTD,best_vionum,best_viocus]=decode(chroms(minInd(1),:),customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
    disp(['Number of Robots: ', num2str(bestNV), ', Total Distance: ', num2str(bestTD), ', Number of violated Path: ', num2str(best_vionum), ', Number of Violated Customer: ', num2str(best_viocus)]);
    fprintf('\n');
    generation = generation + 1;
end
ObjV = calObj(chroms,customer_number,time_window1,time_window2,depot_time_window2,service_time,distance_matrix);
[minObjV,minInd]=min(ObjV);

disp('Optimal Result:')
bestChrom=chroms(minInd(1),:);
[bestVC,bestNV,bestTD,best_vionum,best_viocus]=decode(bestChrom, customer_number, time_window1, time_window2, depot_time_window2, service_time, distance_matrix);
disp(['Number of Robots: ', num2str(bestNV), ', Total Distance: ', num2str(bestTD), ', Number of violated Path: ', num2str(best_vionum), ', Number of Violated Customer: ', num2str(best_viocus)]);

flag = Judge(bestVC, time_window1, time_window2, depot_time_window2, service_time, distance_matrix);

% check the missing element in the final result
missing_element = judgeFullElement(bestVC, customer_number);

drawMap(bestVC, vertexs);




