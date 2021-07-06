% input:
% vehicle_customer ---------- a cell which contains all routes

% output:
% final_vehicles_customer --- an matrix which contains all customer
% vehicles_used ------------- number of vehicles

% delete empty routes in the cell and get the number of vehicles
function [final_vehicles_customer,vehicles_used] = deleteEmptyRoutes(vehicles_customer)
    vecnum=size(vehicles_customer,1); % number of vehicles
    final_vehicles_customer={}; % cell 
    count = 1;
    for i = 1:vecnum
        customers = vehicles_customer{i}; % customers of every vehicle
        if ~isempty(customers) % if this route is not empty
            final_vehicles_customer{count} = customers;
            count = count+1;
        end
    end
    final_vehicles_customer = final_vehicles_customer'; 
    vehicles_used = size(final_vehicles_customer,1);
end