% 先随机选出一个顾客？
% input:
% cusnum: customer number
% to_remove: the number need to be removed
% final_vehicles_customer: customer in every route
% output:
% removed: the customers been removed
% rfvc: the customer remain
function [removed, rfvc] = remove(cusnum, to_remove, D, dist, final_vehicles_customer)
    inplan = 1 : cusnum; % all customers
    visit = ceil(rand * cusnum); % choose one customer randomly
    inplan(inplan == visit) = []; % delete this customer
    removed = [visit]; % record the removed customer
    
    while length(removed) < to_remove
        nr = length(removed); % customer already been removed
        vr = ceil(rand * nr); % choose one removed customer 
        nip = length(inplan); % the remaining customer
        R = zeros(1, nip); % store Relatedness
        for i = 1 : nip
            % calculated Relatedness between a removed customer and all
            % other customers
            R(i) = Relatedness(removed(vr), inplan(i), dist, final_vehicles_customer);
        end
        [SRV, SRI] = sort(R, 'descend');
        lst = inplan(SRI); % sort the remaining customer
        vc = lst(ceil(rand^D*nip)); 
        % choose one customer, if D == 1, choose randomly, if D->inf, choose the customer with highest relateness
        removed = [removed vc]; 
        inplan(inplan == vc) = []; % delete
    end
    rfvc = final_vehicles_customer; % final customer
    nre = length(removed); %final customer been removed
    NV = size(final_vehicles_customer, 1); % number of vehicle
    % check
    for i = 1 : NV
        route = final_vehicles_customer{i};
        for j = 1 : nre
            findri = find(route == removed(j), 1, 'first');
            if ~isempty(findri)
                route(route == removed(j)) = [];
            end
        end
        rfvc{i} = route;
    end
    
    [rfvc, ~] = deleteEmptyRoutes(rfvc);
end