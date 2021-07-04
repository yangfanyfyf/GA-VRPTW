% check the time window constrains
function flag=Judge(VC,a,b,L,s,dist)
    flag=1;
    NV=size(VC,1);
    bsv=beginServiceVehicles(VC,a,s,dist);
    violate_INTW=Judge_TW(VC,bsv,b,L);
    for i=1:NV
        find1=find(violate_INTW{i}==1,1,'first');      
        if ~isempty(find1)
            flag=0;
            break
        end
    end
end