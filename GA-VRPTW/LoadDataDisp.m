% use salved date

load('test_1.mat');

N = histogram(num_iter,120)
disp('Number of Iterations: ');
disp(['Average: ',num2str(mean(num_iter)), ', Standard Deviation: ', num2str(std(num_iter))]);
fprintf('\n')

disp('Time of Iterations: ');
disp(['Average Single Iteration Time: ', num2str(mean(aver_iter_time))])
fprintf('\n')

disp('Time of Complete Calculations: ');
disp(['Average Calculation Time: ', num2str(mean(main_time))])