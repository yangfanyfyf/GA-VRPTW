% cal the staet time of vehicle
function bsv = beginServiceVehicles(vehicles_customer,a,s,dist)
    n = size(vehicles_customer,1);
    bsv = cell(n,1);
    for i=1:n
        route = vehicles_customer{i};
        % use time window and service time to calculate the start time and
        % return time
        [bs,back] = begin_s(route,a,s,dist); 
        bsv{i} = [bs,back]; % save it to the cell
    end
end
