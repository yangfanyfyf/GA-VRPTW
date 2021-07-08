% check the time window constrains 
% 1 == viotate 
function flag = Judge(VC,a,b,L,s,dist)
    flag = 0;
    NV = size(VC,1);
    bsv = beginServiceVehicles(VC,a,s,dist); % begin of service of every customer
    violate_INTW = Judge_TW(VC,bsv,b,L); % check the TW of every customer
    for i = 1:NV
        % if 1 is found, means at least one customer is violated.
        find1 = find(violate_INTW{i} == 1,1,'first');
        if ~isempty(find1) 
            flag = 1;
            break
        end
    end
end