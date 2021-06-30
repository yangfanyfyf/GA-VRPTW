% check the time window
function [violate_TW] = Judge_TW( vehicles_customer,bsv,b,L )
    NV=size(vehicles_customer,1);               
    % violate_TW=cell(NV,1);
    violate_TW=bsv;
    for i=1:NV
        route=vehicles_customer{i};
        bs=bsv{i};
        l_bs=length(bsv{i});
        for j=1:l_bs-1
            if bs(j)<=b(route(j))
                violate_TW{i}(j)=0;
            else
                violate_TW{i}(j)=1;
            end
        end
        if bs(end)<=L
            violate_TW{i}(end)=0;
        else
            violate_TW{i}(end)=1;
        end
    end

end