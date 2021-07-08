% calculate the value of objective function
function ObjV = calObj(chroms,cusnum,a,b,L,s,dist)
    n = size(chroms,1); % number of all vehicle                       
    ObjV = zeros(n,1);                        
    for i=1:n
        % VC, customers of every vehicle
        [VC, ~, ~, ~, ~]=decode(chroms(i,:),cusnum,a,b,L,s,dist);
        % distance + weight * late time
        ObjV(i) = costFuction(VC,a,b,s,L,dist);
    end
end
