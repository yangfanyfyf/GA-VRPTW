function p_l= part_length(route,dist)
    n=length(route);
    p_l=0;
    if n~=0
        for i=1:n
            if i==1
                p_l=p_l+dist(1,route(i)+1);
            else
                p_l=p_l+dist(route(i-1)+1,route(i)+1);
            end
        end
        p_l=p_l+dist(route(end)+1,1);
    end
end