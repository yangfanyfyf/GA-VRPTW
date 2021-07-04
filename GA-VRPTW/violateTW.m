function [w]=violateTW(curr_vc,a,b,s,L,dist)
    NV=size(curr_vc,1);                         %所用车辆数量
    w=0;
    bsv=beginServiceVehicles(curr_vc,a,s,dist);            %计算每辆车配送路线上在各个点开始服务的时间，还计算返回仓库时间
    for i=1:NV
        route=curr_vc{i};
        bs=bsv{i};
        l_bs=length(bsv{i});
        for j=1:l_bs-1
            if bs(j)>b(route(j))
                w=w+bs(j)-b(route(j));
            end
        end
        if bs(end)>L
            w=w+bs(end)-L;
        end
    end
end