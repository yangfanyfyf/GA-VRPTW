function [civ,cip,C]= cheapestIP( rv,rfvc,L,a,b,s,dist)
NV=size(rfvc,1);              
outcome=[]; % save the insert point
for i=1:NV
    route=rfvc{i}; 
    len=length(route);
    LB= part_length(route,dist);       
    
    for j=1:len+1
        if j==1
            temp_r=[rv route];
            LA= part_length(temp_r,dist);       
            delta=LA-LB;
            [bs,back]= begin_s(temp_r,a,s,dist );
            violate_TW=(bs'<=b(temp_r));
            vTW=find(violate_TW==0,1,'first');
            if isempty(vTW)&&(back<=L)
                outcome=[outcome;i j delta];
            end
        elseif j==len+1
            temp_r=[route rv];
            LA= part_length(temp_r,dist);
            delta=LA-LB;
            [bs,back]= begin_s( temp_r,a,s,dist );
            violate_TW=(bs'<=b(temp_r));          
            vTW=find(violate_TW==0,1,'first'); 
            % check the time window constrains
            if isempty(vTW)&&(back<=L)
                outcome=[outcome;i j delta];
            end
        else
            temp_r=[route(1:j-1) rv route(j:end)];
            LA= part_length(temp_r,dist);       
            delta=LA-LB;
            [bs,back]= begin_s( temp_r,a,s,dist );
            violate_TW=(bs'<=b(temp_r)); 
            vTW=find(violate_TW==0,1,'first');  
            if isempty(vTW)&&(back<=L)
                outcome=[outcome;i j delta];
            end
        end
    end
end

if ~isempty(outcome)
    addC=outcome(:,3);
    [saC,sindex]=sort(addC);
    temp=outcome(sindex,:);
    civ=temp(1,1);
    cip=temp(1,2);
    C=temp(1,3);
else
    civ=NV+1;
    cip=1;
    C=part_length(rv,dist);
end

end

