function [removed, rfvc] = remove(cusnum, to_remove, D, dist, final_vehicles_customer)
    inplan = 1 : cusnum;
    visit = ceil(rand * cusnum);
    inplan(inplan == visit) = [];
    removed = [visit];
    
    while length(removed) < to_remove
        nr = length(removed); % 当前被移出的顾客数量
        vr = ceil(rand * nr); % 从被移出的顾客中随机选出一个
        nip = length(inplan); % 原来顾客集合中顾客的数量
        R = zeros(1, nip); % 存储相关性数组？
        for i = 1 : nip
            % 计算移出元素和所有其他剩余元素的相关性
            R(i) = Relatedness(removed(vr), inplan(i), dist, final_vehicles_customer);
        end
        [SRV, SRI] = sort(R, 'descend');
        lst = inplan(SRI);
        vc = lst(ceil(rand^D*nip));
        removed = [removed vc]; % 向removed中添加元素
        inplan(inplan == vc) = []; % 移出
    end
    rfvc = final_vehicles_customer;
    nre = length(removed); %最终被移出顾客的总数量
    NV = size(final_vehicles_customer, 1);
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