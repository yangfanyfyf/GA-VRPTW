% check the time window for every customer
% 0 means not violated
function [violate_TW] = Judge_TW(vehicles_customer,bsv,b,L)
    NV = size(vehicles_customer,1); % number of vehicles           
    % violate_TW=cell(NV,1);
    violate_TW = bsv;
    for i = 1:NV
        route = vehicles_customer{i};
        bs = bsv{i}; % for the i-th route
        l_bs = length(bsv{i});
        for j = 1:l_bs-1 % check every customer in this route
            % the start service time is earlier than the latest start time
            % it means the time window is not violated
            if bs(j) <= b(route(j)) 
                violate_TW{i}(j) = 0;
            else
                violate_TW{i}(j) = 1;
            end
        end
        % for the last one, check it with the last arrival time to depot
        if bs(end) <= L
            violate_TW{i}(end) = 0;
        else
            violate_TW{i}(end) = 1;
        end
    end

end