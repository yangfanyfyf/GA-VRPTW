% calculate total late time
function late_time = violateTW(curr_vc,a,b,s,L,dist)
    NV = size(curr_vc,1); % number of vehicles
    late_time = 0;
    bsv = beginServiceVehicles(curr_vc,a,s,dist); % start time and return time
    % for every route
    for i = 1:NV
        route = curr_vc{i}; % choose one route
        bs = bsv{i}; % corresponding start time
        l_bs = length(bsv{i}); 
        % check all time windows
        for j = 1:l_bs-1
            % if start time is later than the left time window 
            if bs(j) > b(route(j))
                % w is the sum of late time
                late_time = late_time + bs(j) - b(route(j));
            end
        end
        % for the return time to depot
        if bs(end) > L
            late_time = late_time + bs(end) - L;
        end
    end
end