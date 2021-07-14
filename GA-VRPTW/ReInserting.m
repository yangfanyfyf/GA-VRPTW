% insert the removed customer to the routes
function [ReIfvc, RTD] = ReInserting(removed,rfvc,L,a,b,s,dist)
    while ~isempty(removed)
       [fv,fviv,fvip,fvC]=farthestINS(removed,rfvc,L,a,b,s,dist);
       removed(removed == fv) = [];
       [rfvc, iTD] = insert(fv, fviv, fvip, fvC, rfvc, dist);
    end
    [rfvc, ~] = deleteEmptyRoutes(rfvc);
    
    ReIfvc = rfvc;
    
    [RTD, ~] = travel_distance(ReIfvc, dist);
end